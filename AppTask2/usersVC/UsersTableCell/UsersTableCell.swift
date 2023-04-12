//
//  UsersTableCell.swift
//  AppTask2
//
//  Created by Ashu on 28/03/23.
//

import UIKit

class UsersTableCell: UITableViewCell {

    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var CompanyLable: UILabel!
    @IBOutlet weak var websiteLable: UILabel!
    @IBOutlet weak var phoneLable: UILabel!
    @IBOutlet weak var addressLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var usernamelable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var idLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 15
        
        Utility.addshadow(mainView)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUserdata(_ model: Users) {
        idLable.text = "\(model.id ?? 0)"
        nameLable.text = model.name
        usernamelable.text = model.username
        emailLable.text = model.email
        addressLable.text = " \(model.address.zipcode)  \(model.address.street)  \(model.address.city) \(model.address.suite)  \(model.address.geo.lng ?? " ")  \(model.address.geo.lat ?? " ")"
        phoneLable.text = model.phone
        websiteLable.text = model.website
        CompanyLable.text = "\(model.company.name ?? " ") \(model.company.catchPhrase ?? " ") \(model.company.bs ?? " ")"
    }
    
  
}
