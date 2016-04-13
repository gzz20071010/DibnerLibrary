//
//  DataService.swift
//  DibnerLibraryApp
//
//  Created by shengxiang guo on 4/4/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

//
//  DataService.swift
//  showcase
//
//  Created by shengxiang guo on 1/26/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = "https://dibnerlibraryapp.firebaseio.com"

class DataService{
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: URL_BASE)
    private var _REF_MAP = Firebase(url:"\(URL_BASE)/library")
    private var _REF_USERS = Firebase(url:"\(URL_BASE)/users")
    //private var _REF_RESERVATIONS = Firebase(url:"\(URL_BASE)/users/\(UID)/reservations")
    
    var REF_MAP: Firebase{
        return _REF_MAP
    }
//    var REF_RESERVATIONS: Firebase{
//        return _REF_RESERVATIONS
//    }
    
    var REF_USERS: Firebase{
        return _REF_USERS
    }
    
    var REF_BASE: Firebase{
        return _REF_BASE
    }
    
    var REF_USER_CURRENT: Firebase{
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
        let user = Firebase(url: "\(URL_BASE)").childByAppendingPath("users").childByAppendingPath(uid)
        return user!
    }
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>){
        REF_USERS.childByAppendingPath(uid).setValue(user)
    }
}