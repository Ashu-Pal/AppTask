//
//  ToDosDataVC.swift
//  AppTask2
//
//  Created by Ashu on 30/03/23.
//

import UIKit

class ToDosDataVC: UIViewController {

    @IBOutlet weak var ToDosTableView: UITableView!
    var todosViemodel2 = ToDosViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - initialize function
    func initialize(){
        ToDosTableView.register(UINib(nibName: "ToDosTableCell", bundle: nil), forCellReuseIdentifier: "ToDosTableCell")
        ToDosTableView.estimatedRowHeight = UITableView.automaticDimension
        getToDosFromAPI()
    }
    
    // MARK: -
    func getToDosFromAPI(){
        Utility.showIndicator()
        todosViemodel2.getToDos{[weak self] success, Error in
            guard let self = self else {return}
            if success{
                self.ToDosTableView.reloadData()
            }else{
                print("error!")
            }
            Utility.hideIndicator()
        }
    }
    @IBAction func backButton(_ sender: Any) {
        
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
extension ToDosDataVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todosViemodel2.toDosData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ToDosTableView.dequeueReusableCell(withIdentifier: "ToDosTableCell", for: indexPath) as! ToDosTableCell
        cell.setToDoData(todosViemodel2.toDosData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
