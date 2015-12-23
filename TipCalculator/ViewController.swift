//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jiayi Kou on 12/20/15.
//  Copyright © 2015 Jiayi Kou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!

    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var oneLabel: UILabel!
    @IBOutlet var twoLabel: UILabel!
    @IBOutlet var threeLabel: UILabel!
    @IBOutlet var rateSection: UISegmentedControl!
    @IBAction func onEditingChanged(sender: AnyObject) {
        refreshView()

    }
    @IBAction func onClick(sender: AnyObject) {
        let settingsView = self.storyboard?.instantiateViewControllerWithIdentifier("SettingsViewController") as? SettingsViewController
        self.presentViewController(settingsView!, animated: true, completion: nil)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func onRateChanged(sender: AnyObject) {
        refreshView()    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   var symbol = ""
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        billTextField.becomeFirstResponder()
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tax")
        rateSection.selectedSegmentIndex = intValue
        var symbolObject = defaults.objectForKey("symbol") as! String
        symbol = "\(symbolObject)"
        defaults.synchronize()
        
        refreshView()
    }

    func refreshView() {
        var tipPercent = [0.15,0.18,0.2]
        let tipPercentValue = tipPercent[rateSection.selectedSegmentIndex]
        let bill = NSString(string:billTextField.text!).doubleValue
        let tip = bill * tipPercentValue
        let total = tip + bill
    
        tipLabel.text = String(format:"\(symbol) %.2f",tip)
        totalLabel.text = String(format:"\(symbol) %.2f",total)
        oneLabel.text = String(format:"\(symbol) %.2f",total)
        twoLabel.text = String(format:"\(symbol) %.2f",total/2)
        threeLabel.text = String(format:"\(symbol) %.2f",total/3)
    }
    
}

