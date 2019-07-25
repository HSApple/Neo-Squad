//
//  ViewController.swift
//  Food App
//
//  Created by Eduardo Cortez on 7/24/19.
//  Copyright © 2019 Farside 13. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        // This will show in the next view controller being pushed
        
        if (segue.identifier == "breakfastSegue") {
            // pass data to next view controller
            let vc : TableViewController = (segue.destination as! TableViewController)
            vc.mealType = "BREAKFAST"
        } else if (segue.identifier == "lunchSegue") {
            let vc : TableViewController = (segue.destination as! TableViewController)
            vc.mealType = "LUNCH"
        } else {
            let vc : TableViewController = (segue.destination as! TableViewController)
            vc.mealType = "DINNER"
        }
    }

}

