//
//  calcFunctions.swift
//  simple-calc
//
//  Created by iGuest on 4/28/16.
//  Copyright © 2016 Tanner. All rights reserved.
//

import Foundation

// A generic "math operation" function that takes in two Doubles and passes them to a given function,
// returning the resulting Double
func mathOp(leftOperator: Int, rightOperator: Int, op: (Int, Int) -> Double) -> Double {
    return op(leftOperator, rightOperator);
}

// An addition function that takes in two Doubles and returns the sum of both as a Double
func additionOp(leftOperator: Int, rightOperator: Int) -> Double {
    return Double(leftOperator + rightOperator);
}

// A subtraction function that takes in two Doubles and returns the difference of both as a Double
func subtractionOp(leftOperator: Int, rightOperator: Int) -> Double {
    return Double(leftOperator - rightOperator);
}

// A multiplication function that takes in two Doubles and returns the product of both as a Double
func multiplicationOp(leftOperator: Int, rightOperator: Int) -> Double {
    return Double(leftOperator * rightOperator);
}

// A division function that takes in two Doubles and returns the quotient of both as a Double
func divisionOp(leftOperator: Int, rightOperator: Int) -> Double {
    return Double(leftOperator / rightOperator);
}

// A mod function that takes in two Doubles and returns the mod of the first mod the second as a Double
func modOp(leftOperator: Int, rightOperator: Int) -> Double {
    return Double(leftOperator % rightOperator);
}

func factorial(factInt: Int) -> Int {
    if(factInt <= 1) {
        return 1;
    } else {
        return factInt * factorial(factInt - 1);
    }
}