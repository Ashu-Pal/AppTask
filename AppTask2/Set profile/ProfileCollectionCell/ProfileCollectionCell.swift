//
//  ProfileCollectionCell.swift
//  AppTask2
//
//  Created by Rinchu on 28/02/23.
//

import UIKit

class ProfileCollectionCell: UICollectionViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var cellContentView: UIView!
    
    @IBOutlet weak var addPhotoButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellContentView.layer.cornerRadius=10
        profileImage.layer.cornerRadius=10
        //addPhoto.layer.cornerRadius = addPhoto.frame.height/2
        // Initialization code
    }
    func setImage(_ imgName: String){
        profileImage.image=UIImage(named: imgName)
    }

 
    
}
