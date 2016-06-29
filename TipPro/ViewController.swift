//
//  ViewController.swift
//  TipPro
//
//  Created by Miriam Hendler on 6/21/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet   var billAmountTextField: UITextField?
    @IBOutlet weak var TipPercentSegment: UISegmentedControl?
    
    @IBOutlet  var tipAmountField: UITextField?
    
    @IBOutlet  var totalField: UITextField?
    @IBAction func tipSegment(sender: UISegmentedControl){
        getTipAmountAndTotal()
    }
    @IBAction func calculateButton(sender: AnyObject) {
       getTipAmountAndTotal()
        
        }
    
    func getTipAmountAndTotal() {
        guard let billAmount = Double((billAmountTextField?.text!)!) else {
            billAmountTextField?.text = ""
            tipAmountField?.text = ""
            totalField!.text = ""
            return
        }
            var tipPercentage = 0.0
            switch TipPercentSegment!.selectedSegmentIndex {
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
        let tipAmount = billAmount * tipPercentage
        let totalAmount = tipAmount + billAmount
        
        tipAmountField?.text = String(tipAmount)
        totalField?.text = String(totalAmount)

        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

