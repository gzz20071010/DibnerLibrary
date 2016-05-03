//
//  AddPlantVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/12/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import DropDown

class AddPlantVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var roomNumber: UITextField!
    @IBOutlet weak var dateBtn: UIButton!
    @IBOutlet weak var hourBtn: UIButton!
    @IBOutlet weak var minBtn: UIButton!
    
    @IBOutlet weak var dateBtn2: UIButton!
    @IBOutlet weak var hrBtn2: UIButton!
    @IBOutlet weak var minBtn2: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    let dropDown = DropDown()
    let dropDown2 = DropDown()
    let dropDown3 = DropDown()
    let dropDown4 = DropDown()
    let dropDown5 = DropDown()
    let dropDown6 = DropDown()
    
    var rooms = [Room]()

    var availiableRooms = [Room]()
    
    var selectDate = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "New Reservation"
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        //day datasource
        dropDown.dataSource = [
            "0\(DAY)",
            "0\(DAY+1)",
            "0\(DAY+2)"
        ]
        
        dropDown4.dataSource = dropDown.dataSource
        self.tableView.dataSource  = self
        self.tableView.delegate = self
        
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
        
        let computerList = ["1","2","3","4","5","6","7","8"]
        
        let resRef = ref.childByAppendingPath("library")
        
        resRef.observeEventType(.Value, withBlock:{snapshot in
            self.rooms = [Room]()
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for snap in snapshots{
                    //print("SNAP: \(snap)")
                    //print("\(snap.key)")
                    var dates = [Date]()
                    if let value = snap.value as? Dictionary<String, String>{
                        //print(value)
                        for (key, value) in value {
                          //  print(key)
                          //  print(value)
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
                    let room = Room(number: "\(snap.key)", reservations: dates)
                    
                    var isLaptop = false
                    for x in computerList{
                        if room.roomNumber == x{
                            isLaptop = true
                        }
                    }
                    if !isLaptop {
                        self.rooms.append(room)
                    }
                   // self.reservations.append("\(snap.key)")
                }
                //print("====")
                //print(self.rooms.count)
                //print("self.reservation: ", self.reservations)
            
             
            }
        })


    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availiableRooms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("RoomCell", forIndexPath: indexPath) as? RoomCell{
            let room = availiableRooms[indexPath.row]
            if room.roomNumber == "445" || room.roomNumber == "445A" || room.roomNumber == "445B" || room.roomNumber == "445C" || room.roomNumber == "445D"{
                cell.roomNumbLb.text = "\(room.roomNumber) [Four Person Room]"
            }else{
                cell.roomNumbLb.text = "\(room.roomNumber) [Two Person Room]"
            }
            return cell
        }
        return UITableViewCell()
    }
 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.roomNumber.text = availiableRooms[indexPath.row].roomNumber
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
    
    @IBAction func onCheckBtnPressed(sender: AnyObject) {
        let beginTime = "\(dateBtn.titleLabel!.text!)\(hourBtn.titleLabel!.text!)\(minBtn2.titleLabel!.text!)"
        let endTime = "\(dateBtn2.titleLabel!.text!)\(hrBtn2.titleLabel!.text!)\(minBtn2.titleLabel!.text!)"
        let beginDate = parseDate(beginTime)
        let endDate = parseDate(endTime)
        let userSelectedBeginDate = Date(arr: beginDate)
        let userSelectedEndDate = Date(arr: endDate)
        selectDate.append(userSelectedBeginDate)
        selectDate.append(userSelectedEndDate)
        
        availiableRooms = [Room]()
        //var unavalibleRooms = rooms
        
        for room in self.rooms{
            var flag = true
            for (index, element) in (room.reservations.enumerate()) {
                if index%2 == 0{
                    if element.day == userSelectedBeginDate.day{
                        if element.hr <= userSelectedBeginDate.hr{
                            if room.reservations[index+1].hr > userSelectedBeginDate.hr{
                                flag = false
                            }
                        }
                        else if element.hr > userSelectedBeginDate.hr {
                            if element.hr < userSelectedEndDate.hr{
                                flag = false
                            }
                        }
                    }
                }
            }
            if flag {
                availiableRooms.append(room)
            }

        }
        //print(availiableRooms)
        self.tableView.reloadData()
        
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
