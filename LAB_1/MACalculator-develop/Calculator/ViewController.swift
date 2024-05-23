//
//  ViewController.swift
//  Calculator
//
//  Created by Martin Drobarov on 31.10.23.
//

import UIKit

class ViewController: UIViewController {

    var workings:String = ""
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    
    @IBOutlet weak var calculatorResoults: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }

    func clearAll(){
        workings = ""
        calculatorWorkings.text = ""
        calculatorResoults.text = ""
    }
    
    func addToWorkings(value: String){
        workings = workings + value
        calculatorWorkings.text = workings
    }
 
    @IBAction func btnAllClear(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func btnBackSpace(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    
    @IBAction func btnEquals(_ sender: Any) {
        if(validInput()){
            let checkWorkingsForPercentage = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format:workings)
            let resoult = expression.expressionValue(with: nil, context: nil) as! Double
            let resoultString = formatResoult(res: resoult)
            calculatorResoults.text = resoultString
        }
        else{
            let alert = UIAlertController(
                title:"invalid input", message: "Calculator unable to calculate the value ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okej", style: .default ))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool{
        return true
    }
    
    func formatResoult(res: Double) -> String{
        if(res.truncatingRemainder(dividingBy: 1)==0){
            return String(format: "%.0f",res)
        }
        else{
            return String(format: "%.2f",res)
        }
    }
    
    @IBAction func btnPercentage(_ sender: Any) {
        addToWorkings(value: "%")
    }
    @IBAction func btnDevide(_ sender: Any) {
        addToWorkings(value: "/")
    }
    @IBAction func btnMultiply(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func btnMinus(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func btnSum(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    
    @IBAction func btnDot(_ sender: Any) {
        addToWorkings(value: ".")
    }
    @IBAction func btnZero(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func btnSix(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func btnNine(_ sender: Any) {
        addToWorkings(value: "9")
    }
    @IBAction func btnEight(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func btnSeven(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func btnFive(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func btnFour(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func btnThree(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func btnTwo(_ sender: Any) {
        addToWorkings(value: "2")
    }
    @IBAction func btnOne(_ sender: Any) {
        addToWorkings(value: "1")
    }
}

