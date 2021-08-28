//
//  ToDoMVCTableViewController.swift
//  ToDoApp
//
//  Created by Роман далинкевич on 22.03.2021.
//

import UIKit

class ToDoMVCTableViewController: UITableViewController {

    var toDoList = RealmManager.shared.getItems()

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage =

    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoMVCCell", for: indexPath)
        let item = toDoList[indexPath.row]
        cell.textLabel?.text = item.name
        cell.backgroundColor = .clear
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            RealmManager.shared.remove(index: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
       }
    }
    
    //MARK: Add button
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alertVC = UIAlertController(title: "New ToDo", message: "What do you want to do?", preferredStyle: .alert)
        alertVC.addTextField { (UITextField) in
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertVC.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "ADD", style: .default) { UIAlertAction -> Void in
            
            let toDoItemTextField = (alertVC.textFields?.first)! as UITextField
            let newToDoListItem = ToDoItems()
            newToDoListItem.name = toDoItemTextField.text!
            newToDoListItem.done = false
            
            RealmManager.shared.save(item: newToDoListItem)
            
            self.tableView.insertRows(at: [IndexPath.init(row: self.toDoList.count - 1, section: 0)], with: .automatic)
        }
        alertVC.addAction(addAction)
        present(alertVC, animated: true, completion: nil)
    
        
    }
    
}
