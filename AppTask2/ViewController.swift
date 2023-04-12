//
//  ViewController.swift
//  AppTask2
//
//  Created by Rinchu on 14/02/23.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    @IBOutlet weak var continueButton: UIButton!
    var lastEmail: String?
    @IBOutlet weak var continiueOUtlet: UIButton!
    var lastPassword: String?
    var validEmail: Bool?
    var validPassword: Bool?
    // view modal object
    var Data = userData()
    var gestureAnimation: longPressView?
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var LoginFB: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        continiueOUtlet.layer.cornerRadius=25
        LoginFB.layer.cornerRadius=25
         lastEmail = UserDefaults.standard.string(forKey: "myEmail")
         lastPassword = UserDefaults.standard.string(forKey: "myPassword")
        addGestures()
        addLongPressGesture()
    }
    
    
    func addGestures(){
        let tapGeseture = UITapGestureRecognizer(target: self, action: #selector(self.gestureHandler))
        self.view.addGestureRecognizer(tapGeseture)
    }
    
    
    @objc func gestureHandler(){
        inputEmail.becomeFirstResponder()
        inputPassword.becomeFirstResponder()
        self.view.endEditing(true)
        
    }

    func addLongPressGesture(){
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressHandler(sender:)))
        LoginFB.addGestureRecognizer(longPress)
    }
    
    
    @objc  func longPressHandler( sender: UILongPressGestureRecognizer){
        switch  sender.state{
        case .began:
            startAnimation()
            break
        case .ended:
            removeAnimation()
            break
        default:
            break
        }
    }
    
    func startAnimation(){
        if gestureAnimation == nil{
            gestureAnimation = Bundle.main.loadNibNamed("longPressView", owner: self, options: nil)?.first as? longPressView
            gestureAnimation?.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
            gestureAnimation?.center = self.view.center
            self.view.addSubview(gestureAnimation ?? UIView())
            gestureAnimation?.transform = CGAffineTransform(scaleX: 0, y: 0)
        }
        
        UIView.animate(withDuration: 1, delay: 0, animations: {
            self.gestureAnimation?.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) {
            (finished) in
        }
    }
    
    
    func removeAnimation(){
        UIView.animate(withDuration: 1, delay: 0.1, animations: {
            self.gestureAnimation?.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        }){
            (finished) in
            self.gestureAnimation?.removeFromSuperview()
            self.gestureAnimation = nil
        }
    }
    
    func emailErrorAlert(){
    let alert = UIAlertController(title: "ShoppingApp", message: "Please enter correct password", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
//        inputEmail.text = nil
    }
    
    func passwordErrorAlert(){
        let alert = UIAlertController(title: "ShoppingApp", message: "Please enter correct password", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
//       inputPassword.text = nil
    }
    
    func emailPasswordErrorAlert(){
        let alert = UIAlertController(title: "ShoppingApp", message: "Please enter valid email & correct password", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
//        inputEmail.text = nil
//        inputPassword.text = nil
    }
    
    func isValidEmailAddr(strToValidate: String) -> Bool {
        
        let emailValidationRegex = "^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: strToValidate)
        
    }
    
    func isValidPassword(strToValidate: String) -> Bool {
        
      let passwordValidateRegex = "^.*(?=.{8,}).*$"
      let passwordValidationPredicate = NSPredicate(format: "SELF MATCHES %@", passwordValidateRegex)
      return passwordValidationPredicate.evaluate(with: strToValidate)
        
    }
    
    
    
    @IBAction func continue1(_ sender: Any) {
//        if inputEmail.text != nil && inputPassword.text != nil{
//            if inputEmail.text ==  lastEmail && inputPassword.text == lastPassword{
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                 let nextVC = storyboard.instantiateViewController(withIdentifier: "HomeTabBar")
//                nextVC.modalPresentationStyle = .fullScreen
//                self.present(nextVC, animated: true)
//                inputEmail.text=nil
//                inputPassword.text=nil
//            }else{
//        let valid1 = validateEmail(inputEmail.text!)
//                if (inputEmail.text != "") && (valid1) && (inputEmail.text != nil){
//                    UserDefaults.standard.setValue(inputEmail.text, forKey: "myEmail")
//                    UserDefaults.standard.setValue(inputPassword.text, forKey: "myPassword")
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                     let nextVC = storyboard.instantiateViewController(withIdentifier: "setNameVC") as! setNameVC
//                    nextVC.modalPresentationStyle = .fullScreen
//                    self.present(nextVC, animated: true)
//                    inputEmail.text=nil
//                    inputPassword.text=nil
//                }else{
//                    let emailAlert = UIAlertController(title: "Email ! ", message: "please enter email", preferredStyle: UIAlertController.Style.alert)
//                    emailAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
//                }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "setNameVC") as! setNameVC
        
         // validation functins
        validEmail = isValidEmailAddr(strToValidate: inputEmail.text!)
        validPassword = isValidPassword(strToValidate: inputPassword.text!)
        if(!(validEmail!) && !(validPassword!)){
           emailPasswordErrorAlert()
        }
        else if(!(validEmail!) || inputEmail.text == "" || inputEmail.text == nil){
            emailErrorAlert()
        }
        else if(!(validPassword!) || inputPassword.text == "" || inputPassword.text == nil){
            passwordErrorAlert()
        }
        else{
//            UserDefaults.standard.setValue(inputEmail.text, forKey: "myEmail")
//            UserDefaults.standard.setValue(inputPassword.text, forKey: "myPassword")
            Data.userEmail = inputEmail.text
            Data.userPassword = inputPassword.text
            nextVC.nameDataOBJ = Data
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        }
        
        
        
        
       // inputEmail.text=nil
//        inputPassword.text=nil
       
//            }
//        }
        
            
    }
//    func validateEmail(_ EMAIL: String) -> Bool{
//           let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//           let resultEmail = NSPredicate(format: "SELF MATCHES %@" , regEx)
//           return resultEmail.evaluate(with: EMAIL)
//       }
//
    
    
//    func validateEmail(_ EMAIL: String) -> Bool{
//        let regEx = "[a-zA-Z0-9._%+-]+@[0-9a-zA-Z]+\\.[a-zA-Z]{2-6}"
//        let resultEmail = NSPredicate(format: "SELF MATCHES %@" , regEx)
//        return resultEmail.evaluate(with: EMAIL)
//    }
//
//    @IBAction func validateEmailAddress(_ sender: UITextField) {
//
//        let valid = validateEmail(inputEmail.text!)
//        if !valid{
//            let alert = UIAlertController(title: "App Task 2", message: "please Enter valid email address", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
//            self.present(alert, animated: true)
//        }
//
//    }
//
//    func passwordValidation (_ PASSWORD: String) -> Bool{
//        let passwordRegEX = "[a-zA-Z.@&%0-9+-]{8,}"
//        let resultPassword = NSPredicate(format: "SELF MATCHES %@",passwordRegEX)
//        return resultPassword.evaluate(with: PASSWORD)
//    }
//
//    @IBAction func checkPassword(_ sender: UITextField) {
//        let validPassword = passwordValidation(inputPassword.text!)
//        if (!validPassword){
//            let passwordAlert = UIAlertController(title: "app task 2", message: "please enter valid password", preferredStyle: UIAlertController.Style.alert)
//            passwordAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
//            self.present(passwordAlert, animated: true)
//        }
//    }
     
    
    
    @IBAction func loginFB(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let nextVC = storyboard.instantiateViewController(withIdentifier: "setNameVC")
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
}

