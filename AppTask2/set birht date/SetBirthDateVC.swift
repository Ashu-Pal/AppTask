//
//  SetBirthDateVC.swift
//  AppTask2
//
//  Created by Rinchu on 14/02/23.
//

import UIKit

class SetBirthDateVC: UIViewController {
    var dobView: DOBPicker?
   // @IBOutlet weak var inputBirthday: UITextField!
    @IBOutlet weak var DobLable: UILabel!
    @IBOutlet weak var continue3: UIButton!
    // dataVM obj
    var birthVMObj = userData()
    override func viewDidLoad() {
        super.viewDidLoad()
        continue3.layer.cornerRadius=20
        DobLable.layer.borderWidth = 1
        DobLable.layer.borderColor = UIColor.gray.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continue3BTN(_ sender: Any) {
        if(DobLable.text == nil || DobLable.text == ""){
            let dobAlert = UIAlertController(title: "Dob alert!", message: "Please enter date of birth", preferredStyle: UIAlertController.Style.alert)
            dobAlert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(dobAlert, animated: true)
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let nextVC = storyboard.instantiateViewController(withIdentifier: "SetGenderVC") as! SetGenderVC
            nextVC.modalPresentationStyle = .fullScreen
            birthVMObj.userDob = DobLable.text
            nextVC.genderVMObj = birthVMObj
            self.present(nextVC, animated: true)
        }
    }
    func DOBErrorAlert(){
        let alert = UIAlertController(title: "DOB Error", message: "please enter valid Date", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func setDate(_ sender: UIButton) {
        
        if dobView == nil {
            dobView = Bundle.main.loadNibNamed("DOBPicker", owner: self, options: nil)?.first as? DOBPicker
            dobView?.frame = self.view.frame
            UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.addSubview(dobView ?? UIView())
            
            dobView?.cancelHandler = { [weak self] in
                guard let self = self else {return}
                self.dobView?.isHidden = true
            }
            
            dobView?.dobSelectionHandler = { [weak self] date in
                guard let self = self else {return}
                
                self.setdateIntextField(dob: date)
                self.dobView?.isHidden = true
            }
        } else {
            self.dobView?.isHidden = false
        }
        
        
        
    }
    
    
    
    
    func setdateIntextField(dob: Date){
        let now = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let currentDate = dateFormatter.string(from: now)
        let selectedDate = dateFormatter.string(from: dob)


        var start = currentDate.index(currentDate.startIndex, offsetBy: 0)
        var end = currentDate.index(currentDate.endIndex, offsetBy: -8)
        var result = currentDate[start..<end]
        guard let currentDay = Int(result) else {return}

        start = currentDate.index(currentDate.startIndex, offsetBy: 3)
        end = currentDate.index(currentDate.endIndex, offsetBy: -5)
        result = currentDate[start..<end]
        guard let currentMonth = Int(result) else {return}

        start = currentDate.index(currentDate.startIndex, offsetBy: 6)
        //end = currentDate.index(currentDate.endIndex, offsetBy: 8)
        result = currentDate[start...]
        guard let currentYear = Int(result) else {return}


        start = selectedDate.index(selectedDate.startIndex, offsetBy: 0)
        end = selectedDate.index(selectedDate.endIndex, offsetBy: -8)
        result = selectedDate[start..<end]
        guard let selectedDay = Int(result) else {return}

        start = selectedDate.index(selectedDate.startIndex, offsetBy: 3)
        end = selectedDate.index(selectedDate.endIndex, offsetBy: -5)
        result = selectedDate[start..<end]
        guard let selectedMonth = Int(result) else {return}

        start = selectedDate.index(selectedDate.startIndex, offsetBy: 6)
        //end = selectedDate.index(selectedDate.endIndex, offsetBy: 8)
        result = selectedDate[start...]
        guard let selectedYear = Int(result) else {return}



        if selectedYear > currentYear{
            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                self.DOBErrorAlert()
            })
            DobLable.text = nil
        }else{
            if(currentYear > selectedYear){
                DobLable.text = selectedDate
            }else{
                if(currentMonth < selectedMonth){
                    DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                        self.DOBErrorAlert()
                    })
                    DobLable.text = nil
                }else{
                    if(currentMonth > selectedMonth){
                        DobLable.text = selectedDate
                    }else{
                        if(currentDay < selectedDay){
                            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                                self.DOBErrorAlert()
                            })
                            DobLable.text = nil
                        }else{
                            DobLable.text = selectedDate
                        }
                    }
                }
            }
        }
        
        
        print("CurrentDate = ",currentDay,currentMonth,currentYear)
        print("SelectedDate = ",selectedDay,selectedMonth,selectedYear)
//        let now = Date()
//        let dateFormatter: DateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//        let currentDate = dateFormatter.string(from: now)
//        let selectedDate: String = dateFormatter.string(from: dob)
//
//        var start = currentDate.index(currentDate.startIndex, offsetBy: 0)
//        var end = currentDate.index(currentDate.endIndex, offsetBy: -8)
//        var result = currentDate[start..<end]
//        guard let currentDay = Int(result) else{return}
//
//        start = currentDate.index(currentDate.startIndex, offsetBy: 3)
//        end = currentDate.index(currentDate.endIndex, offsetBy: -5)
//        result = currentDate[start..<end]
//        guard let currentMonth = Int(result) else{return}
//
//        start = currentDate.index(currentDate.startIndex, offsetBy: 6)
//        result = currentDate[start...]
//        guard let currentYear = Int(result) else{return}
//
//        start = selectedDate.index(selectedDate.startIndex, offsetBy: 0)
//        end = selectedDate.index(selectedDate.endIndex, offsetBy: -8)
//        result = selectedDate[start..<end]
//        guard let selectedDay = Int(result) else{return}
//
//        start = selectedDate.index(selectedDate.startIndex, offsetBy: 3)
//        end = selectedDate.index(selectedDate.endIndex, offsetBy: -5)
//        result = selectedDate[start..<end]
//        guard let selectedMonth = Int(result) else{return}
//
//        start = selectedDate.index(selectedDate.startIndex, offsetBy: 6)
//        result = selectedDate[start...]
//        guard let selectedYear = Int(result) else{return}
//
//        //MARK: - Check for invalid date
//        if(selectedYear > currentYear){
//            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
//                self.DOBErrorAlert()
//            })
//            DobLable.text = nil
//        }
//        else{
//            if(selectedYear < currentYear){
//                DobLable.text = selectedDate
//            }
//            else{
//                if(selectedMonth > currentMonth){
////                    datePicker.isHidden = true
//                    DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
//                        self.DOBErrorAlert()
//                    })
//
//                    DobLable.text = nil
//                }
//                else{
//                    if(selectedMonth < currentMonth){
//                        DobLable.text = selectedDate
//                    }
//                    else{
//                        if(selectedDay > currentDay){
//                            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
//                                self.DOBErrorAlert()
//                            })
//                            DobLable.text = nil
//                        }
//                        else{
//                            DobLable.text = selectedDate
//                        }
//                    }
//                }
//            }
//        }
    }

        
        
        
    
//    @IBAction func SetBirthdate(_ sender: UITextField) {
//        var datepickerView: UIDatePicker = UIDatePicker()
//        datepickerView.datePickerMode = UIDatePicker.Mode.date
//        sender.inputView = datepickerView
//        datepickerView.addTarget(self, action: Selector(("birthDateHandler:")), for: .touchUpInside)
//
//
//
//    }
//
//     func birthDateHandler(sender: UIDatePicker){
//        var dateformatter = DateFormatter()
//        dateformatter.dateFormat = " dd mm yyyy"
//        inputBirthday.text = dateformatter.string(from: (sender.date))
//    }
    
    
    @IBAction func back(_ sender: Any) {
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
