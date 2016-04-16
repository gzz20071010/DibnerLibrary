//
//  RoomCell.swift
//  DibnerLibraryApp
//
//  Created by shengxiang guo on 4/16/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Foundation
class RoomCell: UITableViewCell {
    
    @IBOutlet weak var roomNumbLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            // Initialization code
    }
    
    func parseData(x:Int){
        if x < 10 {
            roomNumbLb.text = "Laptop# \(x)"
        }else{
            roomNumbLb.text = "Room# \(x)"
        }
    }
  
}
