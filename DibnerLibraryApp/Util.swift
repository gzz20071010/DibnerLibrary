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


let SHADOW_COLOR: CGFloat = 157.0/255.0

let ref = Firebase(url: "https://dibnerlibraryapp.firebaseio.com")

let GREEN = 0x7ACE18
let BLUE = 0xB6D9FF

var DAY:Int!
var MONTH:String!
var MIN:Int!
var HR:Int!

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

func parseDate(str:String)->[String]{
    var date = [String]()
    
    let index = str.startIndex.advancedBy(0)
    let dayIndex = str.startIndex.advancedBy(2)
    let hrIndex = str.startIndex.advancedBy(4)
    let minIndex = str.startIndex.advancedBy(6)
    let day = str[Range(start: index, end: dayIndex)]
    let hr = str[Range(start: dayIndex, end: hrIndex)]
    let min = str[Range(start: hrIndex, end: minIndex)]
//    print(day)
//    print(hr)
//    print(min)
    
    date.append(day)
    date.append(hr)
    date.append(min)
    //print(date[0])
    return date
}