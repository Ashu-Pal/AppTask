//
//  tableViewCell.swift
//  AppTask2
//
//  Created by Ashupal on 27/02/23.
//

import UIKit
let Screen_width = UIScreen.main.bounds.width
let Screen_height = UIScreen.main.bounds.height
class tableViewCell: UITableViewCell {

    @IBOutlet weak var mainCollectionVIew: UICollectionView!
    let imgArr = ["shoe1","shoe2","shoe3","shoe4","shoe5","shoe6","shoe7"]
    let PriceArr = [1200,1430,450,740,230,100,200]
    let shoeNamesArr = ["Adidas","Rebok","Redtape","Nike","Puma","Skechers","FlyingMachine"]
    let featureArr = ["High quality shoes","High quality shoes","High quality shoes","High quality shoes","High quality shoes","High quality shoes","High quality shoes"]
    var detail  = "This is the very super quality of the sohoe and very effeciant shoe on huge discount on the shoes."
    var selectCellHandler: ((_ index: Int) -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
        // Initialization code
    }

    
    func initialize(){
        mainCollectionVIew.delegate = self
        mainCollectionVIew.dataSource = self
        mainCollectionVIew.register(UINib(nibName: "collectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "collectionViewHeader")
        mainCollectionVIew.register(UINib(nibName: "collectionCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
    }
    
}
extension tableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shoeNamesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionVIew.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! collectionCell
        cell.setProductData(shoeNamesArr[indexPath.item], PriceArr[indexPath.item], imgArr[indexPath.item])

       return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Screen_width/2 - 10, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let handler = selectCellHandler{
            handler(indexPath.item)
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = mainCollectionVIew.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "collectionViewHeader", for: indexPath) as! collectionViewHeader
        if kind == UICollectionView.elementKindSectionHeader{
            return header
        }
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: Screen_width, height: 50)
    }
    
}
