//
//  TableViewController.swift
//  Food App
//
//  Created by Eduardo Cortez on 7/24/19.
//  Copyright © 2019 Farside 13. All rights reserved.
//

import UIKit
import SQLite3

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mealType:String?
    var db: OpaquePointer?
    var recipes:[String] = []
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = recipes[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print(mealType!)
        
        db = openDatabase()
        make_query(db: db, mealType:mealType!)
        sqlite3_close(db)
    }
    
    func make_query(db: OpaquePointer?, mealType:String) {
        recipes.removeAll()
        let queryString = "SELECT * FROM Recipe WHERE meal_type = \"\(mealType)\";"
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, queryString, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            let id = sqlite3_column_int64(statement, 0)
            
            if let cString = sqlite3_column_text(statement, 1) {
                let name = String(cString: cString)
                recipes.append(name)
            }
        }
        
        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error finalizing prepared statement: \(errmsg)")
        }
        
        statement = nil
        tableView.reloadData()
    }
    
    
    func openDatabase() -> OpaquePointer? {
        
        let dbPath = "/Users/farside13/Documents/Recepies.db"
        
        var db: OpaquePointer?
        if sqlite3_open(dbPath, &db) != SQLITE_OK {
            print("Unable to open database.")
            return nil
        }
        else {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }

    
}
