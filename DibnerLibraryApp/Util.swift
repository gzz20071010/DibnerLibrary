//
//  Util.swift
//  Let It Grow
//
//  Created by shengxiang guo on 2/11/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Firebase
import Foundation
import UIKit

let KEY_UID = "uid"


//segues
let SEGUE_LOGGEDIN = "loggedin"

//Status codes
let STATUS_ACCOUNT_NONEXIST = -8


var UID:String!
var USERNAME:String!

let ref = Firebase(url: "https://dibnerlibraryapp.firebaseio.com")

let GREEN = 0x7ACE18
let BLUE = 0xB6D9FF

var DAY:String!
var MONTH:String!

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}