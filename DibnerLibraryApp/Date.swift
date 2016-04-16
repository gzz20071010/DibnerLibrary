//
//  Date.swift
//  DibnerLibraryApp
//
//  Created by shengxiang guo on 4/15/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Foundation


class Date {
    private var _day: Int!
    private var _hr: Int!
    private var _min: Int!

    var day:Int{
        if _day == nil{
            _day = 0
        }
        return _day
    }
    
    var hr:Int{
        if _hr == nil {
            _hr = 0
        }
        return _hr
    }
    
    var min:Int{
        if _min == nil{
            _min = 0
        }
        return _min
    }
    
    init(day:Int, hr:Int, min:Int){
        self._min = min
        self._hr = hr
        self._day = day
    }
    
    init(arr:[String]){
        self._day = Int(arr[0])!
        self._hr = Int(arr[1])!
        self._min = Int(arr[2])!
    }
    

    
    
    
}