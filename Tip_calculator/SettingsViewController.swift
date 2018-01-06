//
//  SettingsViewController.swift
//  Tip_calculator
//
//  Created by Sijin Wang on 1/6/18.
//  Copyright © 2018 Sijin Wang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipRate: UISegmentedControl!
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navBar.leftBarButtonItem?.title = "Back"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     */
    @IBAction func setDefault(_ sender: Any) {
        let tipIndex = tipRate.selectedSegmentIndex
        let defaults = UserDefaults.standard
        
        defaults.set(tipIndex, forKey: "myTip")
        defaults.synchronize()
    }

}
