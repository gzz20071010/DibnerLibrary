//
//  Room.swift
//  DibnerLibraryApp
//
//  Created by shengxiang guo on 4/15/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Foundation


class Room{
    private var _roomNumber: String!
    private var _reservations: [Date]!
    
    var roomNumber: String{
        if _roomNumber == nil{
            _roomNumber = ""
        }
        return _roomNumber
    }
    
    var reservations: [Date]{
        if _reservations == nil{
            _reservations = [Date]()
        }
        return _reservations
    }
    
    init(number: String, reservations: [Date]){
        self._reservations = reservations
        self._roomNumber = number
    }
}