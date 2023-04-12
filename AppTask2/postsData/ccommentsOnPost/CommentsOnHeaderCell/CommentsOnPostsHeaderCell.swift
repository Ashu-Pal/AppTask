//
//  CmmentsOnPostsHeaderCell.swift
//  AppTask2
//
//  Created by Ashu on 01/04/23.
//

import UIKit

class CommentsOnPostsHeaderCell: UITableViewHeaderFooterView {

    @IBOutlet weak var headerMainView: UIView!
    @IBOutlet weak var commentCountsLbl: UILabel!
    @IBOutlet weak var postDescriptionLable: UILabel!
    @IBOutlet weak var postTitleLbl: UILabel!
   // var count = 0
    override func awakeFromNib() {
        //commentCountsLbl.text = "\(count)"
       // Utility.addshadow(headerMainView)
        
    }
    
    func setCommentOnPostsHeaderData(_ title: String, _ body: String, _ countcomment: Int){
        postTitleLbl.text = title
        postDescriptionLable.text = body
        commentCountsLbl.text = "\(countcomment)"
    }
}
