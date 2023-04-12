//
//  HomeVC.swift
//  AppTask2
//
//  Created by Rinchu on 14/02/23.
//

import UIKit

let scr_width = UIScreen.main.bounds.width
let productcoll_width = UIScreen.main.bounds.width
let scr_height = UIScreen.main.bounds.height
class HomeVC: UIViewController {
   
   // var profileImg = ""
    //@IBOutlet weak var homeImageView: UIImageView!
    // home vc view modal object
    var HomeVMobj = userData()
    @IBOutlet weak var logoutBtnLable: UIButton!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var HomeTableView: UITableView!
    let imgArr = ["shoe1","shoe2","shoe3","shoe4","shoe5","shoe6","shoe7"]
    let PriceArr = [1200,1430,450,740,230,100,200]
    let shoeNamesArr = ["Adidas","Rebok","Redtape","Nike","Puma","Skechers","FlyingMachine"]
    let featureArr = ["High quality shoes","High quality shoes","High quality shoes","High quality shoes","High quality shoes","High quality shoes","High quality shoes"]
    var detail  = "This is the very super quality of the sohoe and very effeciant shoe on huge discount on the shoes. This is big billion sale so purchase your faviroite brands on the big discounts."
    
    
    
   
    let homeTAB = ["All","Popular","Recent","Recomended"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        logoutBtnLable.layer.cornerRadius = logoutBtnLable.frame.height/2
        decodedImage()
        //homeImageView.image = UIImage(named: profileImg ?? "")
        let username = UserDefaults.standard.string(forKey: "namekey")
        userNameLable.text = "hello "+username!
        //let profileImg = UserDefaults.standard.string(forKey: "imagekey")
        
        //setimageOnly()
        // Do any additional setup after loading the view.
    }
//    func setimageOnly(){
//        if profileImg == ""{
//            let profileImageOld = UserDefaults.standard.string(forKey: "profileImageKey")!
//            homeImageView.image = UIImage(named: profileImageOld)
//        }
//
//    }
    
    func decodedImage(){
        guard let data = UserDefaults.standard.data(forKey: "imagekey") else { return }
                     let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
                     let image = UIImage(data: decoded)
        
        logoutBtnLable.setImage(image, for: .normal)
        
    }
    
    
    
    func initialize(){
        HomeTableView.delegate = self
        HomeTableView.dataSource = self
        HomeTableView.register(UINib(nibName: "tableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "tableViewHeader")
        HomeTableView.register(UINib(nibName: "tableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell")
        
        
        
        //        productCollection.delegate=self
        //        productCollection.dataSource=self
        //        productCollection.register(UINib(nibName: "ProductCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionCell")
        //        homeTabCollection.delegate=self
        //        homeTabCollection.dataSource=self
        //        homeTabCollection.register(UINib(nibName: "HomeTabCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCell")
    }
    @IBAction func logoutAction(_ sender: Any) {
        let alert = UIAlertController(title: "App task 2", message: "Are you sure to Logout ?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
            SceneDelegate().deleteData()
            }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
            }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
        
        cell.selectCellHandler = {[weak self] index in
            guard let self = self else{return}
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(identifier: "ShoppingViewController") as! ShoppingViewController
            nextVC.productData = details(imgName: self.imgArr[index], features: self.featureArr[index], price: self.PriceArr[index] , productName: self.shoeNamesArr[index], productDescription: self.detail)

           self.navigationController?.pushViewController(nextVC, animated: true)
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HomeTableView.dequeueReusableHeaderFooterView(withIdentifier: "tableViewHeader") as! tableViewHeader
        header.bannerView.layer.cornerRadius = 25
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        135
    }
    
}
