//
//  ViewController.swift
//  AlertControllerWithUpdateMessage
//
//  Created by Ammy Pandey on 17/07/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    var secondAlert: UIAlertController!
    override func viewDidLoad() {
        super.viewDidLoad()
         secondAlert = UIAlertController(title: "Hello Second Alert", message: "This is my second alert controller", preferredStyle: UIAlertControllerStyle.alert)
        
        //Creating Action For Alert Controller
        
        // OK action
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action: UIAlertAction) in
            // reteriving text of Title of the current Action
            let actionTitle = action.title
            
            // reteriving text of 1st textfield
            let textFieldText = self.secondAlert.textFields?[0].text
            let textFieldText_1 = self.secondAlert.textFields?[1].text
            self.myLabel.text = textFieldText! + "" + textFieldText_1!
        }
        
        //Cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        
        //Delete action
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive) { (action: UIAlertAction) in
            // reteriving text of Title of the current Action
            let actionTitle = action.title
            self.myLabel.text = "\(actionTitle!) is pressed"
        }
        // disabling action button
        deleteAction.isEnabled = false
        
        // adding action to actionController
        secondAlert.addAction(okAction)
        secondAlert.addAction(cancelAction)
        secondAlert.addAction(deleteAction)
        
        
        // Adding UITextField in AlertContorller
        secondAlert.addTextField { (textFiled: UITextField) in
            textFiled.placeholder = "Login Please"
        }
        
        secondAlert.addTextField(configurationHandler: nil)
        

        
    }

    @IBAction func alert_clicked(_ sender: Any) {
        present(secondAlert, animated: true) { 
            self.view.backgroundColor = UIColor.gray
        }
    }
    @IBAction func update_clicked(_ sender: Any) {
        
        //changing / updating string value of alert controller
         
        secondAlert.title = "Hello M now Update"
        secondAlert.message = " this is update message "
    }

}

