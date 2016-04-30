//
//  ViewController.swift
//  simple-calc
//
//  Created by iGuest on 4/28/16.
//  Copyright © 2016 Tanner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    let operationDict : [String: ((Int, Int) -> Double)] = [
        "+" : additionOp,
        "-" : subtractionOp,
        "*" : multiplicationOp,
        "/" : divisionOp,
        "%" : modOp
    ]
    
    var CalculatorState = CalcState()
    override func viewDidAppear(animated: Bool) {
        displayLabel.text = CalculatorState.display
    }
    
    
    func restartCalc() {
        CalculatorState.display = ""
        CalculatorState.currentNumberString = ""
        CalculatorState.numbersArray = []
        CalculatorState.operation = ""
        CalculatorState.count = 0
        CalculatorState.displayAnswer = false
        displayLabel.text = ""
    }

    
    @IBAction func AddNumber(sender: UIButton) {
        CalculatorState.count = CalculatorState.count + 1
        if(CalculatorState.displayAnswer) {
            restartCalc()
        }
        CalculatorState.currentNumberString = "\(CalculatorState.currentNumberString)\(sender.currentTitle!)"
        displayLabel.text = "\(displayLabel.text!)\(sender.currentTitle!)"
        CalculatorState.display = displayLabel.text!
    }
    
    
    @IBAction func AddOperation(sender: UIButton) {
        NSLog("\(CalculatorState.currentNumberString)")
        CalculatorState.numbersArray.append(Int(CalculatorState.currentNumberString)!)
        if sender.currentTitle! != "Fact" {
            CalculatorState.currentNumberString = ""
        }
        //Check to see if there's currently a simple operator being applied and ensure that the
        //current operation is either empty or the same as the proposed operation
        if CalculatorState.operation == "" || CalculatorState.operation == sender.currentTitle! {
            CalculatorState.operation = sender.currentTitle!
            displayLabel.text = "\(displayLabel.text!)" + " \(sender.currentTitle!) "
        } else {
            NSLog("\(sender.currentTitle!) does not match \(CalculatorState.operation)")
        }
        CalculatorState.display = displayLabel.text!
    }
    
    @IBAction func equalControll(sender: UIButton) {
        var answer: String = ""
        CalculatorState.numbersArray.append(Int(CalculatorState.currentNumberString)!)
        if CalculatorState.operation == "Count" {
            answer = String(CalculatorState.count)
        } else if CalculatorState.operation == "Avg" {
            let amt : Double = Double(CalculatorState.numbersArray.count)
            let sum : Double = Double(CalculatorState.numbersArray.reduce(0, combine: +))
            answer = String(sum / amt)
        } else if CalculatorState.operation == "Fact" {
            answer = String(factorial(Int(CalculatorState.currentNumberString)!))
        } else {
            answer = String(mathOp(CalculatorState.numbersArray[0], rightOperator: CalculatorState.numbersArray[1], op: operationDict[CalculatorState.operation]!))
        }
        displayLabel.text = "\(displayLabel.text!) = \(answer)"
        CalculatorState.displayAnswer = true
        CalculatorState.display = displayLabel.text!
        CalculatorState.history = "\(CalculatorState.history)\n" + displayLabel.text!
        NSLog(CalculatorState.history)
    }
    
    @IBAction func clearControl(sender: AnyObject) {
        restartCalc();
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "historySegue") {
            let destination = segue.destinationViewController as! HistoryController;
            destination.historyText = CalculatorState.history
            
        } else {
            NSLog("unknown segue")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}

