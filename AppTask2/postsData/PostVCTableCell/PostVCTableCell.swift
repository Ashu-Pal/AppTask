//
//  PostVCTableCell.swift
//  AppTask2
//
//  Created by Ashu on 27/03/23.
//

import UIKit

class PostVCTableCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 15
        Utility.addshadow(mainView)
        // Initialization code
    }
    
    // MARK: - shadow function
//    func addshadow(){
//        MainView.clipsToBounds = true
//        MainView.layer.shadowRadius = 5
//        MainView.layer.shadowOpacity = 1.0
//        MainView.layer.shadowOffset = CGSize(width: 3, height: 3)
//        MainView.layer.shadowColor = UIColor.black.cgColor
//        MainView.layer.masksToBounds = false
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: - function for showing data
    func setPostData(_ postModel: Posts){
        titleLable.text = postModel.title
        descriptionLable.text = postModel.body
    }
    
}
