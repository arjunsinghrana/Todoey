//
//  ViewController.swift
//  Todoey
//
//  Created by Arjun Singh on 16/07/18.
//  Copyright © 2018 Arjun Singh. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray: [Item] = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let newItem = Item()
        newItem.title = "Yo boi"
        newItem.done = true
        itemArray.append(newItem)
        itemArray.append(newItem)
        
        
//        if let items = defaults.array(forKey: "itemArray") as? [Item] {
//            itemArray = items
//        }
    }


    //MARK - TableView Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        let checked = item.done
        cell.accessoryType = checked ? .checkmark : .none
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let checked: Bool = itemArray[indexPath.row].done
        itemArray[indexPath.row].done = !checked
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true) 
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Item"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //TODO - What happens when user adds item
            
            let text = textField.text!
            
            let newItem = Item()
            newItem.title = text
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "itemArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addAction(action)
        
        
        
        present(alert, animated: true, completion: nil)
    }
}

