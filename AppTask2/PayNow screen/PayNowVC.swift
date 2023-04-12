//
//  PayNowVC.swift
//  AppTask2
//
//  Created by Rinchu on 16/02/23.
//

import UIKit
let scrn_width = UIScreen.main.bounds.width
struct paidDetail {
   var imageName = ""
    var productName2 = ""
    var productType2 = ""
    var productPrice = 0
}
class PayNowVC: UIViewController {
    var productData2 = paidDetail()
    @IBOutlet weak var productPurchased: UICollectionView!
    @IBOutlet weak var TotalAmount: UILabel!
    @IBOutlet weak var segment2Outlet: UISegmentedControl!
    @IBOutlet weak var menuToolButton: UIButton!
    @IBOutlet weak var backToShop: UIButton!
    @IBOutlet weak var PayNow: UIButton!
    @IBOutlet weak var profileImage1: UIImageView!
    var NumberOfproduct:[String] = []
   
    var quantitty = 1
    var price2 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage1.layer.cornerRadius=profileImage1.frame.height/2
        
        menuToolButton.layer.cornerRadius=menuToolButton.frame.height/2
        PayNow.layer.cornerRadius=PayNow.frame.height/2
        initialize()
        payNowImage()
        TotalAmount.text = "$"+String(productData2.productPrice)+".00"
        price2 = productData2.productPrice
        // Do any additional setup after loading the view.
    }
    
    func initialize(){
        
        productPurchased.delegate=self
        productPurchased.dataSource=self
        productPurchased.register(UINib(nibName: "PayNowCollection", bundle: nil), forCellWithReuseIdentifier: "PayNowCollection")
        //productPurchased.reloadData()
        
    }
    func payNowImage(){
        guard let data =  UserDefaults.standard.data(forKey: "imagekey") else {
            return
        }
        let decodedImage = try! PropertyListDecoder().decode(Data.self, from: data)
        let image = UIImage(data: decodedImage)
        profileImage1.image = image
    }

//    @IBAction func segment2Action(_ sender: Any) {
//        switch segment2Outlet.selectedSegmentIndex{
//        case 0:
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let nextVC = storyboard.instantiateViewController(identifier: "HomeVC") as! HomeVC
//            nextVC.modalPresentationStyle = .fullScreen
//            
//            //nextVC.setprice(PriceArr[indexPath.item])
//            self.present(nextVC, animated: true)
//        case 2:
//            
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let nextVC = storyboard.instantiateViewController(identifier: "ShoppingViewController") as! ShoppingViewController
//            nextVC.modalPresentationStyle = .fullScreen
//            
//            //nextVC.setprice(PriceArr[indexPath.item])
//            self.present(nextVC, animated: true)
//        default:
//            break
//        }
//    }
    @IBAction func backToShopBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PayNowVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: scrn_width, height: 140)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productPurchased.dequeueReusableCell(withReuseIdentifier: "PayNowCollection", for: indexPath) as! PayNowCollection
        cell.setDetail(productData2.imageName, productData2.productName2, productData2.productType2, productData2.productPrice)
        // collecton view cell action button code
        cell.IncreaseQuantity.tag = indexPath.row
        cell.IncreaseQuantity.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        cell.decreaseQuantityBtn.tag = indexPath.row
        cell.decreaseQuantityBtn.addTarget(self, action: #selector(decreaseAction(sender:)), for: .touchUpInside)
        
        return cell
        
    }
   // collectionview cell action method
    
    @objc func buttonAction(sender: UIButton){
        let index = IndexPath(row: sender.tag, section: 0)
        let cell = productPurchased.cellForItem(at: index) as! PayNowCollection
        
        cell.quantityLable.text = String(quantitty+1)
        quantitty+=1
        productData2.productPrice = productData2.productPrice + price2
        cell.productPrice.text = String(productData2.productPrice)
        TotalAmount.text = "$"+String(productData2.productPrice)+".00"
        productPurchased.reloadData()
    }
    @objc func decreaseAction(sender: UIButton){
        let index2 = IndexPath(row: sender.tag, section: 0)
        let cell = productPurchased.cellForItem(at: index2) as! PayNowCollection
        
            
            
            if quantitty > 1{
                productData2.productPrice = productData2.productPrice - productData2.productPrice/quantitty
                cell.productPrice.text = String(productData2.productPrice)
                quantitty-=1
                cell.quantityLable.text = String(quantitty)
            }
            //var price2 = productData2.productPrice/quantitty
            
            
        
        TotalAmount.text = "$"+String(productData2.productPrice)+".00"
        productPurchased.reloadData()
    }
        
    
    
}
