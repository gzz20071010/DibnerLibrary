//
//  SideOneVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/12/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Firebase

class SideOneVC: UIViewController {

    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var beginTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var roomNumber: UILabel!
    
    var roomNumberStr:String!
    var beginStr = String()
    var hasReservation = false
    //var endStr = String()
    
    //var reservations = Dictionary<String,AnyObject>()
    var reservations = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = 160

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.navigationItem.title = "My Reservation"
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.translucent = false


    }

    override func viewDidAppear(animated: Bool) {
        var beginTime = [String]()
        var endTime = [String]()
        
        
        let resRef = ref.childByAppendingPath("users").childByAppendingPath("\(UID)").childByAppendingPath("reservations")
        
        resRef.observeEventType(.Value, withBlock:{snapshot in
            self.reservations = [String]()
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for snap in snapshots{
                    print("SNAP: \(snap)")
                    // let value = snap.value
                    self.reservations.append("\(snap.key)")
                    self.roomNumberStr = snap.key
                    if let time = snap.value as? Dictionary<String,String> {
                        for (key, value) in time{
                            beginTime = parseDate(key)
                            endTime = parseDate(value)
                            self.beginStr = key
                        }
                    }
                }
                
                if beginTime.count != 0 {
                    self.roomNumber.text = "           Room Number: \(self.roomNumberStr)"
                    self.beginTime.text = "              Begin Time: \(beginTime[1]):\(beginTime[2])"
                    self.endTime.text = "              End Time: \(endTime[1]):\(endTime[2])"
                    self.dateLbl.text = "              Date: \(beginTime[0])"
                    self.hasReservation = true
                }else{
                    self.roomNumber.text = "           Room Number: "
                    self.beginTime.text = "              Begin Time: "
                    self.endTime.text = "              End Time: "
                    self.dateLbl.text = "              Date: "
                }
                
                //print("self.reservation: ", self.reservations)
                //  self.tableView.reloadData()
                
                
                //            if self.reservations.count == 0 {
                //                self.tableView.hidden = true
                //            }else{
                //                self.tableView.hidden = false
                //            }
            }
        })
        
    }

//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return reservations.count
//    }
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCellWithIdentifier("ReservationCell", forIndexPath: indexPath) as? reservationCell{
//            let str = reservations[indexPath.row]
//            if let myNumber = NSNumberFormatter().numberFromString(str) {
//                let myInt = myNumber.integerValue
//                cell.parseData(myInt)
//                //cell.textLb.text = str
//                //print(reservations[indexPath.row])
//                return cell
//            }
//        }
//        return UITableViewCell()
//    }
    
    @IBAction func onCancelPressed(sender: AnyObject) {
        
        if hasReservation {
            let rmRef = ref.childByAppendingPath("users").childByAppendingPath(UID!).childByAppendingPath("reservations").childByAppendingPath("\(roomNumberStr)")
            rmRef.removeValue()
        
            let rmRefLib = ref.childByAppendingPath("library").childByAppendingPath("\(roomNumberStr)").childByAppendingPath(beginStr)
            rmRefLib.removeValue()
        
            let roomRef = ref.childByAppendingPath("library")
            roomRef.updateChildValues(["\(roomNumberStr)":true])
            
            self.roomNumber.text = "           Room Number: "
            self.beginTime.text = "              Begin Time: "
            self.endTime.text = "              End Time: "
            self.dateLbl.text = "              Date: "
            
            hasReservation = false
          
            self.showAlert("Notification", msg: "Reservation Canceled")
            self.viewDidLoad()
            self.viewDidAppear(true)
            self.roomNumber.text = "           Room Number: "
            self.beginTime.text = "              Begin Time: "
            self.endTime.text = "              End Time: "
            self.dateLbl.text = "              Date: "
        }
        
    }
    
    func showAlert(title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
}
