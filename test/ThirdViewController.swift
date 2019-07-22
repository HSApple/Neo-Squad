//
//  thirdViewController.swift
//  test
//
//  Created by student on 7/15/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import SQLite3

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var listView: UITableView!

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
            }
    
    if sqlite3_finalize(statement) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error finalizing prepared statement: \(errmsg)")
    }
    statement = nil
}
    let queryStatementString = "SELECT * FROM Contact;"
    let insertStatementString = "INSERT INTO Contact (Id, Name) VALUES (?, ?);"
    let queryStatementString2 = "SELECT * FROM (file name);"
    
        override func viewDidLoad() {
            super.viewDidLoad()

        // Do any additional setup after loading the view.
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


