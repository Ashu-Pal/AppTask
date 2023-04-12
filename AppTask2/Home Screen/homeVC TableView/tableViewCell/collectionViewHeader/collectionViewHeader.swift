//
//  collectionViewHeader.swift
//  AppTask2
//
//  Created by Ashupal on 27/02/23.
//

import UIKit

class collectionViewHeader: UICollectionReusableView {

    @IBOutlet weak var tabCollectionCell: UICollectionView!
    let homeTabArr = ["all","trending","fashion","brandy","recmmended"]
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
        // Initialization code
    }
    func initialize(){
        tabCollectionCell.delegate=self
        tabCollectionCell.dataSource=self
        tabCollectionCell.register(UINib(nibName: "tabCollectionCell", bundle: nil), forCellWithReuseIdentifier: "tabCollectionCell")
    }
}
extension collectionViewHeader: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeTabArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tabCollectionCell.dequeueReusableCell(withReuseIdentifier: "tabCollectionCell", for: indexPath) as! tabCollectionCell
        cell.setTabName(homeTabArr[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = homeTabArr[indexPath.item].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)])
        return CGSize(width: size.width + 50, height: collectionView.bounds.size.height)

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = tabCollectionCell.cellForItem(at: indexPath) as! tabCollectionCell
        cell.tabName.backgroundColor = UIColor(red: 255/255, green: 156/255, blue: 168/255, alpha: 1.0)
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = tabCollectionCell.cellForItem(at: indexPath) as! tabCollectionCell
        cell.tabName.backgroundColor = UIColor.lightGray
    }
    
}
