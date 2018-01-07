//
//  ViewController.swift
//  Tip_calculator
//
//  Created by Sijin Wang on 1/2/18.
//  Copyright © 2018 Sijin Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipRate: UISegmentedControl!
    @IBOutlet weak var settings: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "myTip")
        tipRate.selectedSegmentIndex = tipIndex
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 0/255.0, green: 122/255.0, blue: 255/255.0, alpha: 1)
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        settings.isEnabled = true
        print("view did appear")
        calculateTip(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
//        print("Hello")
        view.endEditing(true)
//        calculateTip(sender)
    }

    @IBAction func calculateTip(_ sender: Any) {
        let tips = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = tips[tipRate.selectedSegmentIndex] * bill
        let total = tip + bill
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let tipIndex = tipRate.selectedSegmentIndex
        let defaults = UserDefaults.standard
        
        defaults.set(tipIndex, forKey: "myTip")
        defaults.synchronize()
    }
}

