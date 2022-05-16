//
//  ViewController.swift
//  The Best Calculator
//
//  Created by Ibrohimjon Mamajonov on 16/05/22.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Some erron bay can not pars from String to double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
        
    }
    
    private var calculator = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            
            
            guard let result = calculator.calculate(sybol: calcMethod) else {
                fatalError("Some error in calc method")
            }
            displayValue = result
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        
    }
    
}
