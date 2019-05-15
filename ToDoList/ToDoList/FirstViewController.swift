//
//  FirstViewController.swift
//  ToDoList
//
//  Created by sneakysneak on 29/11/2018.
//  Copyright © 2018 sneakysneak. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var items: [String] = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]

        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "Items")
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
        }
        
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(items, forKey: "Items")
            
        }
        
    }


}

