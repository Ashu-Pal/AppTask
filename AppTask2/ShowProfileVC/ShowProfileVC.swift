//
//  ShowProfileVC.swift
//  AppTask2
//
//  Created by Rinchu on 10/03/23.
//

import UIKit

class ShowProfileVC: UIViewController {

    @IBOutlet weak var personalinfoBtn: UIButton!
    @IBOutlet weak var productimageManivVew: UIView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        let name = UserDefaults.standard.string(forKey: "namekey")
//        let userImage = UserDefaults.standard.string(forKey: "imagekey")
        super.viewDidLoad()
        //profileImage.layer.cornerRadius = 20
        nameLable.text = "Welcome,"+name!
        showProfileImage()
        addshadow()
        // Do any additional setup after loading the view.
    }
    
    func showProfileImage(){
        guard let data =  UserDefaults.standard.data(forKey: "imagekey") else {
            return
        }
        let decodedImage = try! PropertyListDecoder().decode(Data.self, from: data)
        let image = UIImage(data: decodedImage)
        profileImage.image = image
        
    }
    
    func addshadow(){
        productimageManivVew.layer.cornerRadius = 10
        productimageManivVew.layer.shadowColor = UIColor.darkGray.cgColor
        productimageManivVew.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        productimageManivVew.layer.shadowRadius = 25.0
        productimageManivVew.layer.shadowOpacity = 0.9
              
        profileImage.layer.cornerRadius = 10
        profileImage.clipsToBounds = true
        print("add shadow called")
    }
    @IBAction func personalInfo(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "personalinfoVC") as! personalinfoVC
        nextVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
 

    @IBAction func moveToPreviousTab(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
