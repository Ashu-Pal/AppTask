//
//  ShoppingViewController.swift
//  AppTask2
//
//  Created by Rinchu on 15/02/23.
//

import UIKit
struct details {
    var imgName = ""
    var features = ""
    var price = 0
    var productName = ""
    var productDescription = ""
}
class ShoppingViewController: UIViewController {
    var productData = details()
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var imagemenbutton: UIButton!
    
    @IBOutlet weak var produtImageViewOutlet: UIView!
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var productimageManivVew: UIView!
    @IBOutlet weak var BuyNowButton: UIButton!
    @IBOutlet weak var ProductDescription: UILabel!
    @IBOutlet weak var ProductFeatures: UILabel!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductPrice: UILabel!
    @IBOutlet weak var Productimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //productimageManivVew.layer.cornerRadius=20
       // Productimage.layer.cornerRadius=20
        BuyNowButton.layer.cornerRadius=BuyNowButton.frame.height/2
        shopButton.layer.cornerRadius=shopButton.frame.height/2
        imagemenbutton.layer.cornerRadius=imagemenbutton.frame.height/2
        likeButton.layer.cornerRadius=likeButton.frame.height/2
        setdetails()
        addshdow()
        
        // Do any additional setup after loading the view.
    }
    
    func addshdow(){
        productimageManivVew.layer.cornerRadius = 20
        productimageManivVew.layer.shadowColor = UIColor.darkGray.cgColor
        productimageManivVew.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        productimageManivVew.layer.shadowRadius = 25.0
        productimageManivVew.layer.shadowOpacity = 0.9
              
        Productimage.layer.cornerRadius = 20
        Productimage.clipsToBounds = true
        }
    
    
    @IBAction func moveToHome(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setdetails(){
        Productimage.image = UIImage(named: productData.imgName)
        ProductDescription.text = productData.productDescription
        ProductPrice.text = "$" + String(productData.price)
        ProductName.text = productData.productName
        ProductFeatures.text = productData.features
    }
//    func setdetails(_ price: Int){
//        ProductPrice.text = String(price)
//    }
    @IBAction func buyNOW(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "PayNowVC") as! PayNowVC
        nextVC.productData2 = paidDetail(imageName: productData.imgName, productName2: productData.productName, productType2: productData.features, productPrice: productData.price)
        nextVC.NumberOfproduct.append("")
        nextVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    @IBAction func backToBuy(_ sender: Any) {
//        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }

}
