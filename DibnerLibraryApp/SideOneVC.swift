//
//  SideOneVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/12/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Firebase

class SideOneVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    
    //var reservations = Dictionary<String,AnyObject>()
    var reservations = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = 160
        tableView.dataSource = self
        tableView.delegate = self

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }

    override func viewDidAppear(animated: Bool) {
        let resRef = ref.childByAppendingPath("users").childByAppendingPath("\(UID)").childByAppendingPath("reservations")

        resRef.observeEventType(.Value, withBlock:{snapshot in
        self.reservations = [String]()
        if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
            for snap in snapshots{
                //print("SNAP: \(snap)")
                // let value = snap.value
                self.reservations.append("\(snap.key)")
            }
                
            //print("self.reservation: ", self.reservations)
            self.tableView.reloadData()
            
            
            if self.reservations.count == 0 {
                self.tableView.hidden = true
            }else{
                self.tableView.hidden = false
            }
        }
        })

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("ReservationCell", forIndexPath: indexPath) as? reservationCell{
            let str = reservations[indexPath.row]
            if let myNumber = NSNumberFormatter().numberFromString(str) {
                let myInt = myNumber.integerValue
                cell.parseData(myInt)
                //cell.textLb.text = str
                //print(reservations[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
}
