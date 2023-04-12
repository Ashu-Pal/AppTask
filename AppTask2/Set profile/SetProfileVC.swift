//
//  SetProfileVC.swift
//  AppTask2
//
//  Created by Rinchu on 14/02/23.
//

import UIKit
import Photos
import Foundation
let screen_width = UIScreen.main.bounds.width
let screen_height = UIScreen.main.bounds.height
class SetProfileVC: UIViewController {
    // profile vc VM
    var profileVMobj = userData()
    var moveTOnext = false
    var index_path: IndexPath?
    @IBOutlet weak var setImageButton: UIButton!
    @IBOutlet weak var imagesCollection: UICollectionView!
    let profileImageArr = ["image1","image2","image3","image4","image5","image6","","",""]
    override func viewDidLoad() {
        super.viewDidLoad()
        initialze()
        // Do any additional setup after loading the view.
    }
    func initialze(){
        imagesCollection.delegate=self
        imagesCollection.dataSource=self
        imagesCollection.register(UINib(nibName: "ProfileCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCollectionCell")
    }
    
    @IBAction func continue5Btn(_ sender: Any) {
        if moveTOnext{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "HomeTabBar") as! Tabbar
            //UserDefaults.standard.setValue(profileImageArr[indexPath.item], forKey: "profileImageKey")
    //        nextVC.profileImg = profileImageArr[indexPath.item]
            
            setUserDataLocally()
            //addPhotoLocally()
            nextVC.modalPresentationStyle = .fullScreen
            
            UIApplication.shared.windows.first?.rootViewController=nextVC
        }else{
            let profileAlert = UIAlertController(title: "App Task 2", message: "please select a picture", preferredStyle: UIAlertController.Style.alert)
            profileAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(profileAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func setImageFromDeviceAction(_ sender: UIButton) {
        let deviceAlert = UIAlertController(title: nil, message: "select option", preferredStyle: .actionSheet)
        
        let galleryAction = UIAlertAction(title: "gallery", style: .default,handler: {
                action in
            self.photoLibrary()
        })
         
        let cameraAction = UIAlertAction(title: "camera", style: .default,handler: {
                action in
            self.cameraAction()
        })
        
        let cancel = UIAlertAction(title: "cancel", style: .default,handler: {
                action in
            self.cancelAction()
        })
        deviceAlert.addAction(galleryAction)
        deviceAlert.addAction(cameraAction)
        deviceAlert.addAction(cancel)
        self.present(deviceAlert, animated: true)
    }
    
    
    func photoLibrary() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
                switch photoAuthorizationStatus {
                case .authorized:
                    DispatchQueue.main.async {
                        self.openGallery()
                    }
                case .notDetermined:
                    PHPhotoLibrary.requestAuthorization({
                        (newStatus) in
                        print("status is \(newStatus)")
                        if newStatus ==  PHAuthorizationStatus.authorized {
                           // / do stuff here /
                            DispatchQueue.main.async {
                                self.openGallery()
                            }
                        }
                    })
                    print("It is not determined until now")
                    
                case .limited:
                    return
                case .restricted:
                    // same same
                    //  print("User do not have access to photo album.")
                    self.galleryAccess()
                case .denied:
                    // same same
                    //print("User has denied the permission.")
                    self.galleryAccess()
                    
                @unknown default:break
                }
        }

    
    func galleryAccess() {
            
            let myAlertVC = UIAlertController(title: "Gallery access is denied earlier, go to settings to access photos", message: "", preferredStyle: UIAlertController.Style.alert)
            
            let yesAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { (action) in
                 
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                  return
                }
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        print("Settings opened: \(success)") // Prints true
                    })
                }
            }
            myAlertVC.addAction(yesAction)
            myAlertVC.addAction(settingsAction)
            
            present(myAlertVC, animated: true, completion: nil)
        }

    
    
    
    
    
    
    func openGallery(){
        let imagepicker = UIImagePickerController()
        imagepicker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        imagepicker.sourceType = .savedPhotosAlbum
        //imagepicker.mediaTypes = [kUTTypeImage as String]
        imagepicker.videoMaximumDuration = 0.0
        imagepicker.allowsEditing = true
        self.present(imagepicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        if let img = info[.editedImage] as? UIImage {
                    profileVMobj.userImage = img

                } else if let img = info[.originalImage] as? UIImage {
                    profileVMobj.userImage = img
                }

                self.dismiss(animated: true, completion: nil)

    }
    
    func addPhotoLocally(){
        guard let data = profileVMobj.userImage?.jpegData(compressionQuality: 0.5) else { return }
                    let encoded = try! PropertyListEncoder().encode(data)
               UserDefaults.standard.setValue(encoded, forKey: "imagekey")
        print("the imag en the bytes is \(encoded)" )
    }
    
    func cameraAction(){
        
    }
    
    func cancelAction(){
        self.dismiss(animated: true)
    }
    
    
    @IBAction func backButton5(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
extension SetProfileVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ProfileCollectionCell
        cell.layer.borderWidth = 10
        cell.layer.borderColor = UIColor.blue.cgColor
        //profileVMobj.userImage = profileImageArr[indexPath.item]
        moveTOnext = true
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
//       self.present(nextVC, animated: true)
    }
    
    func setUserDataLocally(){
        UserDefaults.standard.setValue(profileVMobj.userEmail, forKey: "emailkey")
        UserDefaults.standard.setValue(profileVMobj.userPassword, forKey: "passwordkey")
        UserDefaults.standard.setValue(profileVMobj.userName, forKey: "namekey")
        UserDefaults.standard.setValue(profileVMobj.userDob, forKey: "dobkey")
        UserDefaults.standard.setValue(profileVMobj.userGender, forKey: "genderkey")
        addPhotoLocally()
        //UserDefaults.standard.setValue(profileVMobj.userImage, forKey: "imagekey")
        //let profileImg1 = UserDefaults.standard.string(forKey: "imageKey")
       // print(" \(profileVMobj.userImage!)")
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ProfileCollectionCell
        cell.layer.borderWidth = 0
        cell.layer.borderColor = nil
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imagesCollection.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionCell", for: indexPath) as! ProfileCollectionCell
        
        cell.setImage(profileImageArr[indexPath.item])
        cell.addPhotoButton.addTarget(self, action: #selector(addPhoto(sender:)), for: .touchUpInside)
        cell.addPhotoButton.tag = indexPath.row
        return cell
    }
    
    // -------------------------------------------------------
    @objc func addPhoto(sender : UIButton){
//
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: screen_width/3 - 10, height: screen_height/5 - 20)
    }
   
    
}
