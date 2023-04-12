//
//  tableViewHeader.swift
//  AppTask2
//
//  Created by Ashupal on 27/02/23.
//

import UIKit

class tableViewHeader: UITableViewHeaderFooterView {
    
        @IBOutlet weak var bannerView: UIStackView!
    override func awakeFromNib() {
        bannerView.layer.cornerRadius = 30
    }
//    @IBOutlet weak var tableMainView: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
