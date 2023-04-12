//
//  personalinfoVC.swift
//  AppTask2
//
//  Created by Rinchu on 10/03/23.
//

import UIKit

class personalinfoVC: UIViewController {

    @IBOutlet weak var genderbox: UILabel!
    @IBOutlet weak var DobLable: UILabel!
    @IBOutlet weak var genderLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    let Name1 = UserDefaults.standard.string(forKey: "namekey")
    let email1 = UserDefaults.standard.string(forKey: "emailkey")
    let gneder1 = UserDefaults.standard.string(forKey: "genderkey")
    let dob1 = UserDefaults.standard.string(forKey: "dobkey")
    override func viewDidLoad() {
        super.viewDidLoad()
        showdata()
        // Do any additional setup after loading the view.
    }
    func showdata(){
        if gneder1 == " "{
            genderLable.isHidden = true
            genderbox.isHidden = true
            nameLable.text = Name1
            emailLable.text = email1
            genderLable.text = gneder1
            DobLable.text = dob1
        }else{
            genderLable.isHidden = false
            genderbox.isHidden = false
            nameLable.text = Name1
            emailLable.text = email1
            genderLable.text = gneder1
            DobLable.text = dob1
        }
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
