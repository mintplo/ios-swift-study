//
//  ViewController.swift
//  calculator
//
//  Created by mintplo on 2017. 8. 10..
//  Copyright © 2017년 mintplo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calcResultLabel: UILabel!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!

    var isDidClickOperatorOrOperandOnPrevious: Bool = false
    var isDidClickOperatorOnPrevious: Bool = false
    let calculator = Calculator()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        initializeCalulator()
    }

    func initializeCalulator() {
        calcResultLabel.text = "0"
        calculator.allClear()
        calculator.unsetOperator()
        isDidClickOperatorOnPrevious = false
        isDidClickOperatorOrOperandOnPrevious = false
    }

    func isZeroDisplayed() -> Bool {
        return calcResultLabel.text! == "0"
    }

    func isAllClearButtonCorrect() -> Bool {
        return !isDidClickOperatorOrOperandOnPrevious;
    }

    func updateAllClearButtonLabel() {
        if isAllClearButtonCorrect() {
            allClearButton.setTitle("A/C", for: .normal)
        } else {
            allClearButton.setTitle("C", for: .normal)
        }
    }

    @IBAction func calcButtonTap(_ sender: UIButton) {
        var text = calcResultLabel.text!
        if (isZeroDisplayed()) {
            text = ""
        }

        switch sender {
        case zeroButton:
            if (isDidClickOperatorOnPrevious) {
                text = ""
            }

            calcResultLabel.text = "\(text)0"
            isDidClickOperatorOnPrevious = false
            isDidClickOperatorOrOperandOnPrevious = true

            break
        case oneButton:
            if (isDidClickOperatorOnPrevious) {
                text = ""
            }

            calcResultLabel.text = "\(text)1"
            isDidClickOperatorOnPrevious = false
            isDidClickOperatorOrOperandOnPrevious = true

            break
        case twoButton:
            if (isDidClickOperatorOnPrevious) {
                text = ""
            }

            calcResultLabel.text = "\(text)2"
            isDidClickOperatorOnPrevious = false
            isDidClickOperatorOrOperandOnPrevious = true

            break
        case threeButton:
            if (isDidClickOperatorOnPrevious) {
                text = ""
            }

            calcResultLabel.text = "\(text)3"
            isDidClickOperatorOnPrevious = false
            isDidClickOperatorOrOperandOnPrevious = true

            break
        case fourButton:
            if (isDidClickOperatorOnPrevious) {
                text = ""
            }

            calcResultLabel.text = "\(text)4"
            isDidClickOperatorOnPrevious = false
            isDidClickOperatorOrOperandOnPrevious = true

            break
        case fiveButton:
            if (isDidClickOperatorOnPrevious) {
                text = ""
            }

            calcResultLabel.text = "\(text)5"
            isDidClickOperatorOnPrevious = false
            isDidClickOperatorOrOperandOnPrevious = true

            break
        case sixButton:
            if (isDidClickOperatorOnPrevious) {
                text = ""
            }

            calcResultLabel.text = "\(text)6"
            isDidClickOperatorOnPrevious = false
            isDidClickOperatorOrOperandOnPrevious = true

            break
        case sevenButton:
            if (isDidClickOperatorOnPrevious) {
                text = ""
            }

            calcResultLabel.text = "\(text)7"
            isDidClickOperatorOnPrevious = false
            isDidClickOperatorOrOperandOnPrevious = true

            break
        case eightButton:
            if (isDidClickOperatorOnPrevious) {
                text = ""
            }

            calcResultLabel.text = "\(text)8"
            isDidClickOperatorOnPrevious = false
            isDidClickOperatorOrOperandOnPrevious = true

            break
        case nineButton:
            if (isDidClickOperatorOnPrevious) {
                text = ""
            }

            calcResultLabel.text = "\(text)9"
            isDidClickOperatorOnPrevious = false
            isDidClickOperatorOrOperandOnPrevious = true

            break
        case allClearButton:
            if isDidClickOperatorOnPrevious {
                isDidClickOperatorOnPrevious = false
                calculator.unsetOperator()
            } else if isDidClickOperatorOrOperandOnPrevious {
                isDidClickOperatorOnPrevious = false
                isDidClickOperatorOrOperandOnPrevious = false

                calcResultLabel.text = "0"
            }

            break
        case divideButton:
            isDidClickOperatorOnPrevious = true
            isDidClickOperatorOrOperandOnPrevious = true
            calculator.addOperand(operand: Int(Float(calcResultLabel.text!)!))

            if let result = calculator.setOperator(temp: "/") {
                calcResultLabel.text = "\(Int(result))"
            }
            
            break
        case multiplyButton:
            isDidClickOperatorOnPrevious = true
            isDidClickOperatorOrOperandOnPrevious = true
            calculator.addOperand(operand: Int(Float(calcResultLabel.text!)!))

            if let result = calculator.setOperator(temp: "*") {
                calcResultLabel.text = "\(Int(result))"
            }

            break
        case minusButton:
            isDidClickOperatorOnPrevious = true
            isDidClickOperatorOrOperandOnPrevious = true
            calculator.addOperand(operand: Int(Float(calcResultLabel.text!)!))
           
            if let result = calculator.setOperator(temp: "-") {
                calcResultLabel.text = "\(Int(result))"
            }

            break
        case plusButton:
            isDidClickOperatorOnPrevious = true
            isDidClickOperatorOrOperandOnPrevious = true
            calculator.addOperand(operand: Int(Float(calcResultLabel.text!)!))

            if let result = calculator.setOperator(temp: "+") {
                calcResultLabel.text = "\(Int(result))"
            }

            break
        case resultButton:
            let operand = Int(Float(calcResultLabel.text!)!)
            if (operand == 0) {
                break
            }

            isDidClickOperatorOnPrevious = true
            isDidClickOperatorOrOperandOnPrevious = true

            calculator.addOperand(operand: operand)

            if let result = calculator.setOperator(temp: "=") {
                calcResultLabel.text = "\(Int(result))"
            }

            break
        default:
            break
        }

        updateAllClearButtonLabel()
    }
}
