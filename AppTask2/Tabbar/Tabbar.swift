//
//  Tabbar.swift
//  AppTask2
//
//  Created by Rinchu on 09/03/23.
//

import Foundation
import UIKit

class Tabbar: UITabBarController {
    override var selectedIndex: Int { // Mark 1
            
            didSet {
                guard let selectedViewController = viewControllers?[selectedIndex] else { return }
                selectedViewController.tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 13)], for: .normal)
                //selectedViewController.tabBarItem.selectedImage?.withTintColor((UIColor(red: 255/255, green: 128/255, blue: 121/255, alpha: 1)))
            }
        }
        
        override var selectedViewController: UIViewController? { // Mark 2
            didSet {
                
                guard let viewControllers = viewControllers else { return }
                for viewController in viewControllers {
                    if viewController == selectedViewController {
                        viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 13)], for: .normal)
                        
                    } else { viewController.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12)], for: .normal) }
                }
            }
        }
}
