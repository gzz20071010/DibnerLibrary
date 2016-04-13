//
//  HomeVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/11/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {

    var ref = Firebase(url: "https://dibnerlibraryapp.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func waterBtnPressed(sender: AnyObject) {
        let value = ["Reservation" : "true"]
        let usersRef = ref.childByAppendingPath("users").childByAppendingPath(UID)
        usersRef.updateChildValues(value)
        
        
    }


}
