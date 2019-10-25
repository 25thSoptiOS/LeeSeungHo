//
//  ViewController.swift
//  Calculator
//
//  Created by elesahich on 21/07/2019.
//  Copyright © 2019 elesahich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    private var UserisIntheMiddleofTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if UserisIntheMiddleofTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        UserisIntheMiddleofTyping = true
    }
    
    private var displayValue : Double  {
        get {
            return Double( display.text! )!
        }
        set {
            display.text = String( newValue )
        }
    }
    
    private var brain = calculatorBrarin( )
    
    var savedProgram : calculatorBrarin.Propertylist?
    @IBAction func Save() {
        savedProgram = brain.program
    }
    @IBAction func Restrore() {
        if savedProgram != nil {
            brain.program = savedProgram!
            displayValue = brain.result
        }
    }
    
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if UserisIntheMiddleofTyping {
            brain.setOperand( operand: displayValue )
            UserisIntheMiddleofTyping = false
        }
        if  let mathmaticalSymbol = sender.currentTitle {
            brain.performOperation(symbol:  mathmaticalSymbol)
            //            if mathmaticalSymbol == "π" {
            //                displayValue = M_PI
            //            } else if mathmaticalSymbol == "√" {
            //                displayValue = sqrt(displayValue)
            //            }
        }
        displayValue = brain.result
    }
}

