//
//  MapVC2.swift
//  DibnerLibraryApp
//
//  Created by shengxiang guo on 5/3/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

//
//  MapVC.swift
//  DibnerLibraryApp
//
//  Created by shengxiang guo on 3/23/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Firebase

class MapVC2: UIViewController {
    
    @IBOutlet weak var room432: UIButton!
    @IBOutlet weak var room434: UIButton!
    @IBOutlet weak var room445: UIButton!
    @IBOutlet weak var room445A: UIButton!
    @IBOutlet weak var room445B: UIButton!
    @IBOutlet weak var room445C: UIButton!
    @IBOutlet weak var room445D: UIButton!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var libraryStatus = Dictionary<String, AnyObject>()
    var rooms = [Room]()
    var dates = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if self.revealViewController() != nil {
//            menuButton.target = self.revealViewController()
//            menuButton.action = "revealToggle:"
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//            
//            
//        }
        
        self.navigationItem.title = "Status Map"
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.translucent = false
        
        // Do any additional setup after loading the view.
        //print(timeStr
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        DataService.ds.REF_MAP.observeEventType(.Value, withBlock:{snapshot in
            self.libraryStatus = Dictionary<String, AnyObject>()
            self.rooms = [Room]()
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for snap in snapshots{
                    
                    let key = snap.key as String
                    let value = snap.value
                    
                    self.libraryStatus["\(key)"] = value
                    
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
                    self.rooms.append(room)
                }
            }
            self.updateMap()
            
        })
        
    }
    
    func updateMap(){
        //laptops
        for room in rooms{
            if room.roomNumber == "432"{
                if checkCurrentAvailablity(room){
                    room432.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room432.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            
            if room.roomNumber == "434"{
                if checkCurrentAvailablity(room){
                    room434.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room434.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            
            if room.roomNumber == "445"{
                if checkCurrentAvailablity(room){
                    room445.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room445.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "445A"{
                if checkCurrentAvailablity(room){
                    room445A.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room445A.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "445B"{
                if checkCurrentAvailablity(room){
                    room445B.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room445B.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "445C"{
                if checkCurrentAvailablity(room){
                    room445C.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room445C.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "445D"{
                if checkCurrentAvailablity(room){
                    room445D.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room445D.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            
        }
    }
    
    func checkCurrentAvailablity(room:Room)->Bool{
        //        var timeStr = [String]()
        //        timeStr.append("\(DAY)")
        //        timeStr.append("\(HR)")
        //        timeStr.append("\(MIN)")
        //        let currentDate = Date(arr: timeStr)
        var flag = true
        for (index, element) in (room.reservations.enumerate()) {
            if index%2 == 0{
                if element.day == DAY{
                    if element.hr <= HR{
                        if room.reservations[index+1].hr > HR{
                            flag = false
                        }
                    }
                }
            }
        }
        
        return flag
    }
    
}
