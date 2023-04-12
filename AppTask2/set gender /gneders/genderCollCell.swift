//
//  genderCollCell.swift
//  AppTask2
//
//  Created by Rinchu on 17/02/23.
//

import UIKit

class genderCollCell: UICollectionViewCell {
    var name = " "
    @IBOutlet weak var genderView: UIView!
   
    @IBOutlet weak var genderImage: UIButton!
    @IBOutlet weak var genderLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        genderView.layer.cornerRadius=12
        // Initialization code
    }
    func setgenderData(_ imgName: String, _ gender: String){
        genderImage.setImage(UIImage(named: imgName), for: .normal)
        name = imgName
        genderLable.text=gender
        
        
    }
    func checkGender(){
        if name == "malesign"{
            genderImage.backgroundColor = UIColor(red: 255, green: 138, blue: 135, alpha: 1.0)
            genderLable.backgroundColor = UIColor(red: 255, green: 138, blue: 135, alpha: 1.0)
        }else{
            genderImage.backgroundColor = UIColor(red: 173, green: 230, blue: 251, alpha: 1.0)
            genderLable.backgroundColor = UIColor(red: 255, green: 138, blue: 135, alpha: 1.0)
        }
    }
}
