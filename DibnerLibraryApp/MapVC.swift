//
//  MapVC.swift
//  DibnerLibraryApp
//
//  Created by shengxiang guo on 3/23/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Firebase

class MapVC: UIViewController {
    
    @IBOutlet weak var room432: UIButton!
    @IBOutlet weak var room434: UIButton!
    @IBOutlet weak var room445: UIButton!
    @IBOutlet weak var room445A: UIButton!
    @IBOutlet weak var room445B: UIButton!
    @IBOutlet weak var room445C: UIButton!
    @IBOutlet weak var room445D: UIButton!
    
    @IBOutlet weak var room327: UIButton!
    @IBOutlet weak var room328: UIButton!
    @IBOutlet weak var room335: UIButton!
    @IBOutlet weak var room330: UIButton!
    @IBOutlet weak var room329: UIButton!
    @IBOutlet weak var room334: UIButton!
    @IBOutlet weak var room331: UIButton!
    @IBOutlet weak var room332: UIButton!
    @IBOutlet weak var room333: UIButton!
    
    
    @IBOutlet weak var laptop1: UIButton!
    @IBOutlet weak var laptop2: UIButton!
    @IBOutlet weak var laptop3: UIButton!
    @IBOutlet weak var laptop4: UIButton!
    @IBOutlet weak var laptop5: UIButton!
    @IBOutlet weak var laptop6: UIButton!
    @IBOutlet weak var laptop7: UIButton!
    @IBOutlet weak var laptop8: UIButton!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var libraryStatus = Dictionary<String, AnyObject>()
    var rooms = [Room]()
    var dates = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
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
        if libraryStatus["1"] as! Bool == true {
            laptop1.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["1"] as! Bool == false {
            laptop1.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["2"] as! Bool == true {
            laptop2.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["2"] as! Bool == false {
            laptop2.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["3"] as! Bool == true {
            laptop3.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["3"] as! Bool == false {
            laptop3.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["4"] as! Bool == true {
            laptop4.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["4"] as! Bool == false {
            laptop4.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["5"] as! Bool == true {
            laptop5.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["5"] as! Bool == false {
            laptop5.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["6"] as! Bool == true {
            laptop6.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["6"] as! Bool == false {
            laptop6.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["7"] as! Bool == true {
            laptop7.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["7"] as! Bool == false {
            laptop7.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["8"] as! Bool == true {
            laptop8.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["8"] as! Bool == false {
            laptop8.backgroundColor = UIColor(netHex: Int(BLUE))
        }

     
        for room in rooms{
            if room.roomNumber == "327"{
                if checkCurrentAvailablity(room){
                    room327.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room327.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "328"{
                if checkCurrentAvailablity(room){
                    room328.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room328.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "329"{
                if checkCurrentAvailablity(room){
                    room329.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room329.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "330"{
                if checkCurrentAvailablity(room){
                    room330.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room330.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "331"{
                if checkCurrentAvailablity(room){
                    room331.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room331.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "332"{
                if checkCurrentAvailablity(room){
                    room332.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room332.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "333"{
                if checkCurrentAvailablity(room){
                    room333.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room333.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "334"{
                if checkCurrentAvailablity(room){
                    room334.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room334.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
            if room.roomNumber == "335"{
                if checkCurrentAvailablity(room){
                    room335.backgroundColor = UIColor(netHex: Int(GREEN))
                }else{
                    room335.backgroundColor = UIColor(netHex: Int(BLUE))
                }
            }
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
