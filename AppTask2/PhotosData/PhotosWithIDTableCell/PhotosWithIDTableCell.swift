//
//  PhotosWithIDTableCell.swift
//  AppTask2
//
//  Created by Ashu on 30/03/23.
//

import UIKit

class PhotosWithIDTableCell: UITableViewCell {

    @IBOutlet weak var imageMainView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumID: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        albumImage.layer.cornerRadius = 20
        imageMainView.layer.cornerRadius=20
       Utility.addshadow(imageMainView)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setAlbumImageData(_ model: Photos){
        if let strImg = model.url {
            if let url = URL(string: strImg.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! ) {
                        self.albumImage.nspImageLoader(url: url, placeholder: nil)
                    }
                }
        albumID.text = "\(model.id)"
        albumTitle.text = model.title
    }
   
    
}
