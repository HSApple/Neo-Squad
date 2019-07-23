//
//  thirdViewController.swift
//  test
//
//  Created by student on 7/15/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import SQLite3

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var listView2: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        return cell
    }
    
    let dbPath = "./Recepies.db"
    
    func openDatabase() -> OpaquePointer? {
        var db: OpaquePointer?
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        } else {
            print("Unable to open database. Verify that you created the directory described " +
                "in the Getting Started section.")
            return nil
        }
        
    }
    //make one for each dinner breakfast and lunch
    func make_query(db: OpaquePointer?) {
        let queryString = "SELECT * FROM Recipe:"
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, queryString, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            let id = sqlite3_column_int64(statement, 0)
                print ("id = \(id); ", terminator: "")
                
                if let cString = sqlite3_column_text(statement, 1) {
                    let name = String(cString: cString)
                    print("name = \(name)")
                
                }  else {
                    print("name not found")
                }
            let servings = sqlite3_column_int64(statement, 0)
            print ("servings = \(servings); ", terminator: "")
            
        }
        if let cString = sqlite3_column_text(statement, 1) {
            let serving_size = String(cString: cString)
            print("serving_size = \(serving_size)")
            
            if let cString = sqlite3_column_text(statement, 1) {
                let src = String(cString: cString)
                print("src = \(src)")
                
                let id = sqlite3_column_int64(statement, 0)
                print ("id = \(id); ", terminator: "")
                
                let recipeID = sqlite3_column_int64(statement, 0)
                print ("recipeID = \(recipeID); ", terminator: "")
    
                let step_number = sqlite3_column_int64(statement, 0)
                print ("step_number = \(step_number); ", terminator: "")
                
                let step = String(cString: cString)
                print("step = \(step)")
                
                let type = String(cString: cString)
                print("type = \(type)")
                
                let amount = String(cString: cString)
                print("amount = \(amount)")
                
                let ingredient = String(cString: cString)
                print("ingredient = \(ingredient)")
                
                let description = String(cString: cString)
                print("description = \(description)")
                
                if sqlite3_finalize(statement) != SQLITE_OK {
                    let errmsg = String(cString: sqlite3_errmsg(db)!)
                    print("error finalizing prepared statement: \(errmsg)")
                }
                statement = nil
            }
        let queryStatementString = "SELECT * FROM Contact;"
        let insertStatementString = "INSERT INTO Contact (Id, Name) VALUES (?, ?);"
        let queryStatementString2 = "SELECT * FROM (file name);"
    
            func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int)
                -> Int 
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
