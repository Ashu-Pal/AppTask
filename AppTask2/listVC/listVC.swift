//
//  listVC.swift
//  AppTask2
//
//  Created by Ashu on 27/03/23.
//

import UIKit
enum menu: Int{
    case user = 0
    case posts
    case albums
    case todos
}
class listVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func userBtnAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "PostVC") as! PostVC
        nextVC.chekView = .user
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        
        
    }
    
    @IBAction func postBtnAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "PostVC") as! PostVC
        nextVC.chekView = .posts
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        
        
    }
    
    // MARK: - album button action
    @IBAction func albumBtnAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "PostVC") as! PostVC
        nextVC.chekView = .albums
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // MARK: - todo action button
    @IBAction func toDosActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "PostVC") as! PostVC
        nextVC.chekView = .todos
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
