//
//  AppModel.swift
//  simple-calc
//
//  Created by iGuest on 4/28/16.
//  Copyright © 2016 Tanner. All rights reserved.
//

import Foundation

class CalcState {
    var display: String = ""
    var history: String = ""
    var currentNumberString : String = ""
    var numbersArray : Array<Int> = []
    var operation : String = ""
    var count : Int = 0
    var displayAnswer : Bool = false
}

