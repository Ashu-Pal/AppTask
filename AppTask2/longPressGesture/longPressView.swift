//
//  longPressView.swift
//  AppTask2
//
//  Created by Rinchu on 15/03/23.
//

import UIKit

class longPressView: UIView {
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        mainView.layer.cornerRadius = mainView.frame.height/2
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
