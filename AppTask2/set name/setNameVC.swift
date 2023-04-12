//
//  setNameVC.swift
//  AppTask2
//
//  Created by Rinchu on 14/02/23.
//

import UIKit

class setNameVC: UIViewController {

    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var continue2btn: UIButton!
    var nameDataOBJ = userData()
    override func viewDidLoad() {
        super.viewDidLoad()
        continue2btn.layer.cornerRadius=20
        addGestures()
        // Do any additional setup after loading the view.
    }
    
    func addGestures(){
        let tapGeseture = UITapGestureRecognizer(target: self, action: #selector(self.gestureHandler))
        self.view.addGestureRecognizer(tapGeseture)
    }
    
    
    @objc func gestureHandler(){
        inputName.becomeFirstResponder()
        self.view.endEditing(true)
        
    }
    
    

    @IBAction func continue2(_ sender: UIButton) {
        let nameValid = validName(inputName.text!)
        if inputName.text == nil || inputName.text == ""{
                    let nameAlert2 = UIAlertController(title: "app task 2", message: "please enter name", preferredStyle: UIAlertController.Style.alert)
                    nameAlert2.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
                    self.present(nameAlert2, animated: true)
                }else{
                    if !nameValid{
                        let nameAlert = UIAlertController(title: "app task 2", message: "please enter only characters", preferredStyle: UIAlertController.Style.alert)
                        nameAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
                        self.present(nameAlert, animated: true)
                    }else{
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextVC = storyboard.instantiateViewController(withIdentifier: "SetBirthDateVC") as! SetBirthDateVC
                    nameDataOBJ.userName = inputName.text
                    nextVC.birthVMObj = nameDataOBJ
                    nextVC.modalPresentationStyle = .fullScreen
                    UserDefaults.standard.set(inputName.text, forKey: "userNameKey")
                    self.present(nextVC, animated: true)
                    }
                }
    }
    
    func validName(_ strToValidate: String) -> Bool {
        
        let nameValidationRegex = "^^[A-Za-z\\s]+$"
        let nameValidationPredicate = NSPredicate(format: "SELF MATCHES %@", nameValidationRegex)
        return nameValidationPredicate.evaluate(with: strToValidate)
        
    }
    
    @IBAction func bckButton(_ sender: Any) {
        self.dismiss(animated: true)
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
