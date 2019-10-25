//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by elesahich on 23/07/2019.
//  Copyright © 2019 elesahich. All rights reserved.
//

import Foundation

class calculatorBrarin {
    
    private var accumulator = 0.0
    private var internalProgram = [ AnyObject ] ( )
    
    func setOperand (operand : Double)  {
        accumulator = operand
        internalProgram.append(operand as AnyObject)
    }
    
    private var Operations : Dictionary <String, Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "×" : Operation.BinaryOperation({$0 * $1}),
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "−" : Operation.BinaryOperation({$0 - $1}),
        "=" : Operation.Equals
    ]
    
    private enum Operation {
        case Constant( Double )
        case UnaryOperation( (Double) -> Double )
        case BinaryOperation( (Double,Double) -> Double )
        case Equals
    }
    
    func performOperation ( symbol : String ) {
        internalProgram.append( symbol as AnyObject )
        
        if let operation = Operations[symbol] {
            switch operation {
            case .Constant(let value) :
                accumulator = value
            case .UnaryOperation(let functional) :
                accumulator = functional(accumulator)
            case .BinaryOperation(let functional2) :
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: functional2, firstOperand: accumulator)
            case .Equals :
                executePendingBinaryOperation( )
            }
        }
    }
    private var pending : PendingBinaryOperationInfo?
    
    private func executePendingBinaryOperation ( ) {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
        }
    }
    
    //-------------------------AnyObject, typealias 사용코드  ------------------------
    
    typealias Propertylist = AnyObject
    var program : Propertylist {
        get {
            return internalProgram as calculatorBrarin.Propertylist
        }
        set {
            clear( )
            if let arrayOfOps = newValue as? [ AnyObject ] {
                for op in arrayOfOps {
                    if let operand = op as? Double {
                        setOperand(operand: operand)
                    } else if let operation = op as? String {
                        performOperation(symbol: operation)
                    }
                }
            }
        }
    }
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction : (Double, Double) -> Double
        var firstOperand : Double
    }
    
    func clear ( ) {
        accumulator = 0.0
        pending = nil
        internalProgram.removeAll()
    }
    
    var result : Double {
        get {
            return accumulator
        }
    }
}
