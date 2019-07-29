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
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        db = openDatabase()
        make_query(db: db, meal_type: mealType!)
        sqlite3_close(db)
    }

    
    func openDatabase() -> OpaquePointer? {
        
        let dbPath = "/Users/student/Desktop/project/Neo-Squad/test/Recepies.db"
        
        var db: OpaquePointer?
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        } else {
            print("Unable to open database")
            return nil
        }
        
    }
    //make one for each dinner breakfast and lunch
    func make_query(db: OpaquePointer?, meal_type: String) {
        recipes.removeAll()
        let queryString = "SELECT * FROM Recipe WHERE meal_type = \"\(meal_type)\";"
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
                    recipes.append(name)
            }
        }
        
        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print(errmsg)
        }
         statement = nil
        tableView.reloadData()
    }
}
