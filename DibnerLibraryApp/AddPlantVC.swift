//
//  AddPlantVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/12/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Firebase

class AddPlantVC: UIViewController {

    @IBOutlet weak var roomNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


    @IBAction func onAddPressed(sender: AnyObject) {
        let value = ["\(roomNumber.text!)" : true]
       // print(UID)
        
        let usersRef = ref.childByAppendingPath("library")
        usersRef.updateChildValues(value)
        
        let selfRef = ref.childByAppendingPath("users").childByAppendingPath(UID).childByAppendingPath("reservations")
        selfRef.updateChildValues(value)
        
        performSegueWithIdentifier("sideOneVC", sender: nil)

    }

    @IBAction func onCancelPressed(sender: AnyObject) {
        performSegueWithIdentifier("sideOneVC", sender: nil)
    }
}
