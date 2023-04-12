//
//  PayNowCollection.swift
//  AppTask2
//
//  Created by Rinchu on 16/02/23.
//

import UIKit

class PayNowCollection: UICollectionViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var prodctimage2: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var decreaseQuantityBtn: UIButton!
    @IBOutlet weak var productType: UILabel!
    @IBOutlet weak var quantityLable: UILabel!
    @IBOutlet weak var collectinMainView: UIView!
    @IBOutlet weak var IncreaseQuantity: UIButton!
    @IBOutlet weak var tickButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        prodctimage2.layer.cornerRadius = prodctimage2.frame.height/6
        collectinMainView.layer.cornerRadius = 12
        tickButton.setTitle(nil, for: .normal)
       // quantityLable.text = "1"
        // Initialization code
    }
    func setDetail(_ imageName: String, _ productname: String, _ producttype: String, _ price: Int){
        prodctimage2.image = UIImage(named: imageName)
        productName.text = productname
        productType.text = producttype
        productPrice.text = "$"+String(price)
    }

}
