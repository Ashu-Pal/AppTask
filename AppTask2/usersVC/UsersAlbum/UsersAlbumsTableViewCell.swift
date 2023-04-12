//
//  UsersAlbumsTableViewCell.swift
//  AppTask2
//
//  Created by Ashu on 31/03/23.
//

import UIKit

class UsersAlbumsTableViewCell: UITableViewCell {

    @IBOutlet weak var albumsmainView: UIView!
    @IBOutlet weak var usersAlbumsTitle: UILabel!
    @IBOutlet weak var usersAlbumIdLable: UILabel!
    @IBOutlet weak var usersAlumsUserID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        Utility.addshadow(albumsmainView)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //Utility.addshadow(mainView)
        // Configure the view for the selected state
    }
    
    // MARK: - set usersAlbumData
    func setUserAlbumData(_ model: Albums){
        usersAlbumsTitle.text = model.title
        usersAlumsUserID.text = "\(model.userId)"
        usersAlbumIdLable.text = "\(model.id)"
    }
    
}
