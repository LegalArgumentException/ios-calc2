//
//  HistoryController.swift
//  simple-calc
//
//  Created by iGuest on 4/28/16.
//  Copyright © 2016 Tanner. All rights reserved.
//

import UIKit

class HistoryController: UIViewController {
    var historyText : String! = nil
    
    @IBOutlet weak var historyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyLabel.numberOfLines = 0
        NSLog(historyText)
        historyLabel.text = historyText
    }
}