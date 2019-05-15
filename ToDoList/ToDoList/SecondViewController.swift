//
//  SecondViewController.swift
//  ToDoList
//
//  Created by sneakysneak on 29/11/2018.
//  Copyright © 2018 sneakysneak. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var itemsTextField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "Items")
        
        var items:[String]
        //.text! if the value is an empty string till forcing to unwrap that
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
            items.append(itemsTextField.text!)
            
        } else {
            
            items = [itemsTextField.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "Items")
        //Empty txtField 
        itemsTextField.text = ""
    }
    //Inbuilt method in order to close the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    //Inbuilt method in order to close the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        itemsTextField.resignFirstResponder()
        
        return true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

