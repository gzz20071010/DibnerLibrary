//
//  ChatroomVC.swift
//  DibnerLibraryApp
//
//  Created by shengxiang guo on 5/3/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit

class ChatroomVC: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  self.revealViewController().rearViewRevealWidth = 150
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}
