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
    
    @IBOutlet weak var room401: UIButton!
    @IBOutlet weak var room402: UIButton!
    @IBOutlet weak var room403: UIButton!
    @IBOutlet weak var room410: UIButton!
    @IBOutlet weak var room404: UIButton!
    @IBOutlet weak var room411: UIButton!
    @IBOutlet weak var room405: UIButton!
    @IBOutlet weak var room406: UIButton!
    @IBOutlet weak var room407: UIButton!
    @IBOutlet weak var room409: UIButton!
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

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // Do any additional setup after loading the view.
        
        DataService.ds.REF_MAP.observeEventType(.Value, withBlock:{snapshot in
            self.libraryStatus = Dictionary<String, AnyObject>()
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for snap in snapshots{
                    // print("SNAP: \(snap)")
                    // print("snap value: \(snap.value)")
                    let key = snap.key as String
                    let value = snap.value
                    // print(key)
                    // print("hi")
                    // print(value)
                    self.libraryStatus["\(key)"] = value
                    self.updateMap()
                    
                }
                
                print(self.libraryStatus)
                self.updateMap()
                
            }
        })
   // updateMap()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        DataService.ds.REF_MAP.observeEventType(.Value, withBlock:{snapshot in
            self.libraryStatus = Dictionary<String, AnyObject>()
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for snap in snapshots{
                    // print("SNAP: \(snap)")
                    // print("snap value: \(snap.value)")
                    let key = snap.key as String
                    let value = snap.value
                    // print(key)
                    // print("hi")
                    // print(value)
                    self.libraryStatus["\(key)"] = value
                    self.updateMap()

                }
                
                print(self.libraryStatus)
                self.updateMap()
                
            }
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

        //rooms
        if libraryStatus["401"] as! Bool == true {
            room401.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["401"] as! Bool == false {
            room401.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["402"] as! Bool == true {
            room402.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["402"] as! Bool == false {
            room402.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["403"] as! Bool == true {
            room403.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["403"] as! Bool == false {
            room403.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["404"] as! Bool == true {
            room404.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["404"] as! Bool == false {
            room404.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["405"] as! Bool == true {
            room405.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["405"] as! Bool == false {
            room405.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["406"] as! Bool == true {
            room406.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["406"] as! Bool == false {
            room406.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["407"] as! Bool == true {
            room407.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["407"] as! Bool == false {
            room407.backgroundColor = UIColor(netHex: Int(BLUE))
        }
        if libraryStatus["410"] as! Bool == true {
            room410.backgroundColor = UIColor(netHex: Int(GREEN))
        }else if libraryStatus["410"] as! Bool == false {
            room410.backgroundColor = UIColor(netHex: Int(BLUE))
        }

        
    }

   
}
