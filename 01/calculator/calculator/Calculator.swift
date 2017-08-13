//
//  Calculator.swift
//  calculator
//
//  Created by mintplo on 2017. 8. 10..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import Foundation

class Calculator {
    var operands = [Float]()
    var opt: Character?

    func addOperand(operand: Int) {
        operands.append(Float(operand))
    }

    func setOperator(temp: Character) -> Float? {
        if (temp == "=") {
            let result = calc()
            unsetOperator()

            return result
        }

        if operands.count >= 2 {
            let result = calc()
            opt = temp
            
            addOperand(operand: Int(result!))

            return result
        }

        opt = temp

        return nil
    }

    func getOperator() -> Character? {
        return opt
    }

    func unsetOperator() {
        opt = nil
    }

    func calc() -> Float? {
        var operand1: Float?
        var operand2: Float?

        operand2 = operands.popLast()
        operand1 = operands.popLast()
        
        switch opt! {
        case "/":
            return operand1! / operand2!
        case "+":
            return operand1! + operand2!
        case "-":
            return operand1! - operand2!
        case "*":
            return operand1! * operand2!
        default:
            return nil
        }
    }

    func allClear() {
        opt = nil
        operands.removeAll()
    }
}
