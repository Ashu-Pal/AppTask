//
//  SetGenderVC.swift
//  AppTask2
//
//  Created by Rinchu on 14/02/23.
//

import UIKit
let genderCard_width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height
class SetGenderVC: UIViewController {
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var maleLable: UILabel!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var femaleLable: UILabel!
    @IBOutlet weak var tickButton: UIButton!
    @IBOutlet weak var maleBtnView: UIStackView!
    @IBOutlet weak var femaleBtnView: UIStackView!
    let genderArr = ["male","female"]
    let genderImg = ["malesign","femalesign"]
    var gen = " "
    // gnederVM object
    var genderVMObj = userData()
    override func viewDidLoad() {
        super.viewDidLoad()
        maleBtnView.layer.cornerRadius = 12
        femaleBtnView.layer.cornerRadius = 12
        tickButton.layer.cornerRadius = 4
        //initialize()
        // Do any additional setup after loading the view.
    }
    //    func initialize(){
    //        genderCollectionView.delegate=self
    //        genderCollectionView.dataSource=self
    //        genderCollectionView.register(UINib(nibName: "genderCollCell", bundle: nil), forCellWithReuseIdentifier: "genderCollCell")
    //        genderCollectionView.isScrollEnabled=false
    //    }
    @IBAction func backbutton2(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func continue4Btn(_ sender: Any) {
        
        if gen == " "{
            let genderAlert = UIAlertController(title: "Set Gendrer", message: "please choose gender", preferredStyle: UIAlertController.Style.alert)
            genderAlert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(genderAlert, animated: true)
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "SetProfileVC") as! SetProfileVC
            nextVC.modalPresentationStyle = .fullScreen
            if tickButton.currentImage?.isEqual(UIImage(named: "check-markk")) != nil{
                genderVMObj.userGender = gen
            }else{
                genderVMObj.userGender = " "
            }
            
            nextVC.profileVMobj = genderVMObj
            self.present(nextVC, animated: true)
        }
        
        
        
        
    }
    
    @IBAction func tickBtn(_ sender: Any) {
        if tickButton.currentImage?.isEqual(UIImage(named: "check-markk")) != nil{
            tickButton.setImage(nil, for: .normal)
            tickButton.backgroundColor=UIColor.lightGray
        }else{
            tickButton.setImage(UIImage(named: "check-mark"), for: .normal)
        }
        
    }
    
    @IBOutlet weak var backButton: UIView!
    
    @IBAction func setMale(_ sender: UIButton) {
        maleButton.backgroundColor = UIColor(red: 255/255, green: 138/255, blue: 135/255, alpha: 1.0)
        maleLable.backgroundColor = UIColor(red: 255/255, green: 138/255, blue: 135/255, alpha: 1.0)
        maleLable.textColor = UIColor.white
        femaleLable.textColor = UIColor.black
        femaleButton.backgroundColor = UIColor.white
        femaleLable.backgroundColor = UIColor.white
        gen = "Male"
    }
    @IBAction func setFemale(_ sender: Any) {
        femaleButton.backgroundColor = UIColor(red: 173/255, green: 230/255, blue: 251/255, alpha: 1.0)
        femaleLable.backgroundColor = UIColor(red: 173/255, green: 230/255, blue: 251/255, alpha: 1.0)
        femaleLable.textColor = UIColor.white
        maleLable.textColor = UIColor.black
        maleLable.backgroundColor = UIColor.white
        maleButton.backgroundColor = UIColor.white
        gen = "female"
    }
}
