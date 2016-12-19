//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Sangeeta Ashrit on 12/11/16.
//  Copyright © 2016 Sangeeta Ashrit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabelField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended{
            view.endEditing(true)
        }
    }
    @IBAction func calculateTip(_ sender: Any){
        let percentControlArray = [0, 0.1, 0.15, 0.2]
        if tipPercentControl.selectedSegmentIndex == 4 && tipLabelField.text == ""{
            return
        }
        let billAmount = Double(billField.text!) ?? 0
        
        var tipAmount = 0.0
        if (tipPercentControl.selectedSegmentIndex == 4){
            if tipLabelField.text!.contains("$"){                tipLabelField.text!.remove(at:tipLabelField.text!.startIndex)
            }
            tipAmount = Double(tipLabelField.text!) ?? 0;
        } else {
            tipAmount = billAmount * percentControlArray[tipPercentControl.selectedSegmentIndex]
            tipLabelField.text = String(format:"$%.2f", tipAmount)
        }
        let totalAmount = tipAmount + billAmount
        totalLabel.text = String(format:"$%.2f", totalAmount)
    }
    
    @IBAction func tipChanged(_ sender: Any) {
        
        calculateTip(Any.self)
    }
    @IBAction func customTipCalculate(_ sender: Any) {
        calculateTip(Any.self)
    }
}

