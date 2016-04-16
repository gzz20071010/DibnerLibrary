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
    
    @IBOutlet weak var dateBtn2: UIButton!
    @IBOutlet weak var hrBtn2: UIButton!
    @IBOutlet weak var minBtn2: UIButton!
    
    
    let dropDown = DropDown()
    let dropDown2 = DropDown()
    let dropDown3 = DropDown()
    let dropDown4 = DropDown()
    let dropDown5 = DropDown()
    let dropDown6 = DropDown()
    
    var rooms = [Room]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //day datasource
        dropDown.dataSource = [
            "\(DAY)",
            "\(DAY+1)",
            "\(DAY+2)"
        ]
        
        dropDown4.dataSource = dropDown.dataSource
        
        
        //hr datasource
        dropDown2.dataSource = [
            "09",
            "10",
            "11",
            "12",
            "13",
            "14",
            "15",
            "16",
            "17",
            "18",
            "19",
            "20",
            "21",
            "22",
            "23"
        ]
        dropDown5.dataSource = dropDown2.dataSource
        
        //min datasource
        dropDown3.dataSource = [
            "00",
            "30"
        ]
        dropDown6.dataSource = dropDown3.dataSource
        
        
        dropDown.selectionAction = { [unowned self] (index, item) in
            self.dateBtn.setTitle(item, forState: .Normal)
        }
        
        dropDown2.selectionAction = { [unowned self] (index, item) in
            self.hourBtn.setTitle(item, forState: .Normal)
        }
        
        dropDown3.selectionAction = { [unowned self] (index, item) in
            self.minBtn.setTitle(item, forState: .Normal)
        }
        
        dropDown4.selectionAction = { [unowned self] (index, item) in
            self.dateBtn2.setTitle(item, forState: .Normal)
        }
        
        dropDown5.selectionAction = { [unowned self] (index, item) in
            self.hrBtn2.setTitle(item, forState: .Normal)
        }
        
        dropDown6.selectionAction = { [unowned self] (index, item) in
            self.minBtn2.setTitle(item, forState: .Normal)
        }

        
        dropDown.anchorView = dateBtn
        dropDown.bottomOffset = CGPoint(x: 0, y:dateBtn.bounds.height)
        
        dropDown2.anchorView = hourBtn
        dropDown2.bottomOffset = CGPoint(x: 0, y:hourBtn.bounds.height)
        
        dropDown3.anchorView = minBtn
        dropDown3.bottomOffset = CGPoint(x: 0, y:minBtn.bounds.height)
        
        
        dropDown4.anchorView = dateBtn2
        dropDown4.bottomOffset = CGPoint(x: 0, y:dateBtn2.bounds.height)
        
        
        dropDown5.anchorView = hrBtn2
        dropDown5.bottomOffset = CGPoint(x: 0, y:hrBtn2.bounds.height)
        
        
        dropDown6.anchorView = minBtn2
        dropDown6.bottomOffset = CGPoint(x: 0, y:minBtn2.bounds.height)

    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        let resRef = ref.childByAppendingPath("library")
        
        resRef.observeEventType(.Value, withBlock:{snapshot in
            self.rooms = [Room]()
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for snap in snapshots{
                    //print("SNAP: \(snap)")
                    //print("\(snap.key)")
                    var dates = [Date]()
                    if let value = snap.value as? Dictionary<String, String>{
                        print(value)
                        for (key, value) in value {
                            print(key)
                            print(value)
                            let beginDate = parseDate(key)
                            let endDate = parseDate(value)
                            let beginD = Date(arr:beginDate)
                            let endD = Date(arr: endDate)
                            dates.append(beginD)
                            dates.append(endD)
                        }
                        
                    }
                    //print("====")
                    //print (dates.count)
                    let room = Room(number: Int(snap.key)!, reservations: dates)
                    self.rooms.append(room)
                   // self.reservations.append("\(snap.key)")
                }
                //print("====")
                //print(rooms.count)
                //print("self.reservation: ", self.reservations)
            
             
            }
        })
        

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
    
    @IBAction func onDate2Pressed(sender: AnyObject) {
        if dropDown4.hidden {
            dropDown4.show()
        } else {
            dropDown4.hide()
        }
    }
    
    @IBAction func onHr2Pressed(sender: AnyObject) {
        if dropDown5.hidden {
            dropDown5.show()
        } else {
            dropDown5.hide()
        }
    }
    
    @IBAction func onMin2Pressed(sender: AnyObject) {
        if dropDown6.hidden {
            dropDown6.show()
        } else {
            dropDown6.hide()
        }
    }
    
    
    @IBAction func onAddPressed(sender: AnyObject) {
        //let value = ["\(roomNumber.text!)" : true]
        // print(UID)
        let beginTime = "\(dateBtn.titleLabel!.text!)\(hourBtn.titleLabel!.text!)\(minBtn2.titleLabel!.text!)"
        let endTime = "\(dateBtn2.titleLabel!.text!)\(hrBtn2.titleLabel!.text!)\(minBtn2.titleLabel!.text!)"
        let resv = [beginTime : endTime]
        
        let usersRef = ref.childByAppendingPath("library").childByAppendingPath(roomNumber.text)
        usersRef.updateChildValues(resv)
        
        let selfRef = ref.childByAppendingPath("users").childByAppendingPath(UID).childByAppendingPath("reservations").childByAppendingPath(roomNumber.text)
        selfRef.updateChildValues(resv)
        
        performSegueWithIdentifier("sideOneVC", sender: nil)

    }

    @IBAction func onCancelPressed(sender: AnyObject) {
        //print(dateBtn2.titleLabel?.text)
        performSegueWithIdentifier("sideOneVC", sender: nil)
    }
}
