//
//  tabCollectionCell.swift
//  AppTask2
//
//  Created by Ashupal on 27/02/23.
//

import UIKit

class tabCollectionCell: UICollectionViewCell {

    @IBOutlet weak var tabNameView: UIView!
    @IBOutlet weak var tabName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        tabName.layer.cornerRadius = tabName.frame.height/2
        // Initialization code
    }
    func setTabName(_ name: String){
        tabName.text = name
    }
}
