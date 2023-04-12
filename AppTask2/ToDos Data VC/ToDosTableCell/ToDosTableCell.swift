//
//  ToDosTableCell.swift
//  AppTask2
//
//  Created by Ashu on 30/03/23.
//

import UIKit

class ToDosTableCell: UITableViewCell {

    @IBOutlet weak var checkCompleteSwitch: UISwitch!
    @IBOutlet weak var todoCellmainView: UIView!
    @IBOutlet weak var completedTodo: UILabel!
    @IBOutlet weak var todoTitle: UILabel!
    @IBOutlet weak var todoUserID: UILabel!
    @IBOutlet weak var todoID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        Utility.addshadow(todoCellmainView)
        DispatchQueue.main.async {
            self.todoCellmainView.layer.cornerRadius = self.todoCellmainView.frame.height/2
        }
      //  todoCellmainView.layer.cornerRadius = todoCellmainView.frame.height/2
        checkCompleteSwitch.isUserInteractionEnabled = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setToDoData(_ model: ToDos){
       // todoID.text = "\(model.id)"
       todoTitle.text = model.title
        //todoUserID.text = "\(model.userId)"
       // completedTodo.text = "\(model.completed)"
        if model.completed == true{
            checkCompleteSwitch.isOn = true
        }else{
            checkCompleteSwitch.isOn = false
        }
    }
    
    
    
}
