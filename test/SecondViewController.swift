//
//  SecondViewController.swift
//  test
//
//  Created by student on 7/9/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        if (segue.identifier == "breakfastSegue") {
            let vc : ThirdViewController = (segue.destination as! ThirdViewController)
            vc.mealType = "BREAKFAST" 
        }   else if (segue.identifier == "lunchSegue") {
            let vc : ThirdViewController = (segue.destination as! ThirdViewController)
            vc.mealType = "LUNCH"
        } else {
            let vc : ThirdViewController = (segue.destination as! ThirdViewController)
            vc.mealType = "DINNER"
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
