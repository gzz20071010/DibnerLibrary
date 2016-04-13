//
//  reservationCell.swift
//  DibnerLibraryApp
//
//  Created by shengxiang guo on 4/4/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Foundation

class reservationCell: UITableViewCell {
    
    @IBOutlet weak var textLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func parseData(x:Int){
        if x < 10 {
            textLb.text = "Laptop# \(x)"
        }else{
            textLb.text = "Room# \(x)"
        }
    }
}
