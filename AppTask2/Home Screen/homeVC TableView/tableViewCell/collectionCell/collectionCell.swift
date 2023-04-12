//
//  collectionCell.swift
//  AppTask2
//
//  Created by Ashupal on 28/02/23.
//

import UIKit

class collectionCell: UICollectionViewCell {

    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productNmae: UILabel!
    @IBOutlet weak var productImage: UIImageView!
   
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    func setProductData(_ name: String, _ price: Int, _ imgName: String){
        productNmae.text = name
        productPrice.text = "$"+String(price)
        productImage.image = UIImage(named: imgName)
        
    }

}
