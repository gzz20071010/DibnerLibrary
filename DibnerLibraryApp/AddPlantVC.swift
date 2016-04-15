//
//  AddPlantVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/12/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Firebase
import DropDown

class AddPlantVC: UIViewController {

    @IBOutlet weak var roomNumber: UITextField!
    @IBOutlet weak var dateBtn: UIButton!
    @IBOutlet weak var hourBtn: UIButton!
    @IBOutlet weak var minBtn: UIButton!
    
    let dropDown = DropDown()
    let dropDown2 = DropDown()
    let dropDown3 = DropDown()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDown.dataSource = [
            "April, 2nd",
            "April, 3rd",
            "April, 4th"
        ]
        
        dropDown2.dataSource = [
            "9am",
            "10am",
            "11am"
        ]
        
        dropDown3.dataSource = [
            "00",
            "30"
        ]
        
        dropDown.selectionAction = { [unowned self] (index, item) in
            self.dateBtn.setTitle(item, forState: .Normal)
        }
        
        dropDown2.selectionAction = { [unowned self] (index, item) in
            self.hourBtn.setTitle(item, forState: .Normal)
        }
        
        dropDown3.selectionAction = { [unowned self] (index, item) in
            self.minBtn.setTitle(item, forState: .Normal)
        }
        
        dropDown.anchorView = dateBtn
        dropDown.bottomOffset = CGPoint(x: 0, y:dateBtn.bounds.height)
        
        dropDown2.anchorView = hourBtn
        dropDown2.bottomOffset = CGPoint(x: 0, y:hourBtn.bounds.height)
        
        dropDown3.anchorView = minBtn
        dropDown3.bottomOffset = CGPoint(x: 0, y:minBtn.bounds.height)


    }

    @IBAction func onDropDownBtnPressed(sender: AnyObject) {
        if dropDown.hidden {
            dropDown.show()
        } else {
            dropDown.hide()
        }
    }

    @IBAction func onHourBtnPressed(sender: AnyObject) {
        if dropDown2.hidden {
            dropDown2.show()
        } else {
            dropDown2.hide()
        }
    }
    
    @IBAction func onMinBtnPressed(sender: AnyObject) {
        if dropDown3.hidden {
            dropDown3.show()
        } else {
            dropDown3.hide()
        }
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
