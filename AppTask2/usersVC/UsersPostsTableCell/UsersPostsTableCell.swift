//
//  UsersPostsTableCell.swift
//  AppTask2
//
//  Created by Ashu on 29/03/23.
//

import UIKit

class UsersPostsTableCell: UITableViewCell {

    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var idLblOutlet: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        Utility.addshadow(idView)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(_ model: Posts){
        titleLbl.text = model.title
        idLblOutlet.text = "\(model.id)"
        descriptionLbl.text = model.body
    }
    
    // MARK: - function for getting albumsData
    func setAlbumData(_ model: Albums){
        titleLbl.text = model.title
        idLblOutlet.text = "\(model.id)"
        descriptionLbl.text = "\(model.userId)"
    }
    
    
}
