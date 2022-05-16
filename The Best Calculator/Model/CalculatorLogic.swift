//
//  CalculaterLogic.swift
//  The Best Calculator
//
//  Created by Ibrohimjon Mamajonov on 16/05/22.
//

import UIKit

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(sybol: String) -> Double? {
        if let n = number {
            switch sybol {
            case "+/-":
                return n * -1
            case "AC" :
                return 0
            case "%" :
                return n * 0.01
            case "=" :
                return performTwoNumCalculation(n2: n)
            default:
                self.intermediateCalculation = (n1: n, calcMethod: sybol)
            }
        }
        
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not ")
            }
        }
        return nil
    }
    
}
