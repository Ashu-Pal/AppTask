//
//  AppDelegate.swift
//  AppTask2
//
//  Created by Rinchu on 14/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        if checkData(){
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let nextVC = storyboard.instantiateViewController(identifier: "HomeVC") as! HomeVC
//            UIApplication.shared.windows.first?.rootViewController=nextVC
//            UIApplication.shared.windows.first?.makeKeyAndVisible()
//        }else{
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let nextVC = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
//            UIApplication.shared.windows.first?.rootViewController=nextVC
//            UIApplication.shared.windows.first?.makeKeyAndVisible()
//        }
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

//    func checkData() -> Bool{
//        if let _ = UserDefaults.standard.string(forKey: "myEmail"),let _ = UserDefaults.standard.string(forKey: "myPassword"){
//            return true
//        }else{
//            return false
//        }
//    }
}
extension UIApplication {
  func topmostViewController() -> UIViewController? {
    return keyWindow?.rootViewController?.topmostViewController()
  }
}
