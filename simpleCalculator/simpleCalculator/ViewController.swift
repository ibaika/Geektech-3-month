//
//  ViewController.swift
//  simpleCalculator
//
//  Created by ibaikaa on 1/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstValueTextField: UITextField!
    
    
    @IBOutlet weak var secondValueTextField: UITextField!
    

    @IBOutlet weak var resultLabel: UILabel!
    
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    
    func isNumberGiven(_ v: String?) -> Bool{
        v != nil && Double(v!) != nil ? true : false
    }
    
    func numberOutOfString(_ n: String?) -> Double{
        var number: Double = 0
        
        if let n = n {
            if let x = Double(n){
                number = x
            }
        }
        return number
    }
    
    func isWholeNumberValue(_ v: Double) -> Bool{
        v.truncatingRemainder(dividingBy: 1) == 0
    }
    
    func calculateValues(_ v1: String?, _ v2: String?, action: String){
        var summ: Double = 0
        if isNumberGiven(v1) && isNumberGiven(v2){
            
            let firstNumber: Double = numberOutOfString(v1)
            let secondNumber: Double = numberOutOfString(v2)
            
            switch action{
            case "+": summ = firstNumber + secondNumber
            case "-": summ = firstNumber - secondNumber
            case "*": summ = firstNumber * secondNumber
            case "/": summ = firstNumber / secondNumber
            default: print("unexpected error caught!")
            }
            
            if isWholeNumberValue(summ){
                resultLabel.text = String(Int(summ))
            } else {
                resultLabel.text = String(summ)
            }
            
            
            
        
        } else { resultLabel.text = "введите число!" }
    }
    
    
    @IBAction func add(_ sender: UIButton) {
        calculateValues(firstValueTextField.text, secondValueTextField.text, action: "+")
    }
    
    
    @IBAction func subtract(_ sender: UIButton) {
        calculateValues(firstValueTextField.text, secondValueTextField.text, action: "-")
    }
    
    
    @IBAction func multiply(_ sender: UIButton) {
        calculateValues(firstValueTextField.text, secondValueTextField.text, action: "*")
    }
    

    @IBAction func divideNumbers(_ sender: UIButton) {
        calculateValues(firstValueTextField.text, secondValueTextField.text, action: "/")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}



//is Number?
//if is, get the number and return action  with number
