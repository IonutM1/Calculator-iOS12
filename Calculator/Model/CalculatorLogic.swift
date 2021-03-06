//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Ionut Marinica on 12/02/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    
    private var number : Double?
    
    private var intermiediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermiediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    
    }
    
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermiediateCalculation?.n1,
            let operation = intermiediateCalculation?.calcMethod {
            
            switch operation {
                
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "÷":
                return n1 / n2
                
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        
            
        }
        return nil
    }
}
