//
//  Utility.swift
//  RedimateIOSCode
//
//  Created by Mudasir on 21/03/213.
//

import UIKit
import Foundation
class Utility {
    
    open class func getTopViewController() -> UIViewController? {
        return UIApplication.shared.topmostViewController()
    }
    
    class func showIndicator() {
        SwiftLoader.show(animated: true)
    }
    
    class func hideIndicator() {
        SwiftLoader.hide()
    }
    
    open class func showAlert(message:String,title:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction.init(title: "Ok", style: .cancel, handler: nil))
      
        let viewController = getTopViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if IS_IPAD {
                guard let viewRect = viewController?.view else {
                    return
                }
                if let popoverController = alert.popoverPresentationController {
                    popoverController.sourceView = viewRect
                    popoverController.sourceRect = CGRect(x: viewRect.bounds.midX, y: viewRect.bounds.midY, width: 0, height: 0)
                }
            }
            viewController?.present(alert, animated: true)
        }
    }
    
    public class func printToConsole(message : Any) {
        #if DEBUG
             print(message)
        #endif
    }
    private init(){}
    
    
    // MARK: - addshadow function
    class func addshadow(_ mainView: UIView){
        mainView.clipsToBounds = true
        mainView.layer.shadowRadius = 7
        mainView.layer.shadowOpacity = 0.1
        mainView.layer.shadowOffset = CGSize(width: 1, height: 1)
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.masksToBounds = false
        mainView.layer.cornerRadius = 15
    }
    
    
}
