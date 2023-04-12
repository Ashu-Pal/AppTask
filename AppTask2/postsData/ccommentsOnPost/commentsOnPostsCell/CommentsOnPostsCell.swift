//
//  CommentsOnPostsCell.swift
//  AppTask2
//
//  Created by Ashu on 31/03/23.
//

import UIKit

class CommentsOnPostsCell: UITableViewCell {

    @IBOutlet weak var commentmainView: UIView!
    @IBOutlet weak var commentID: UILabel!
    @IBOutlet weak var commentBodyDescription: UILabel!
    @IBOutlet weak var viewAsImage: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        Utility.addshadow(commentmainView)
        viewAsImage.layer.cornerRadius = viewAsImage.frame.height/2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCommentOnPostData(_ model: Comments){
        commentID.text = "\(model.id)"
        commentBodyDescription.text = model.body
    }
    
    
    
}
