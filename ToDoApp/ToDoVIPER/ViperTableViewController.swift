//
//  ViperTableViewController.swift
//  ToDoApp
//
//  Created by Роман далинкевич on 23.03.2021.
//

import UIKit

class ViperTableViewController: UITableViewController {

    @IBOutlet var viperTableView: UITableView!
    
    @IBOutlet var addButton: UIBarButtonItem!
    
    var toDoList: [ViperItems] = []
    
    var presenter: ViperPresenterInput = ViperPresrnter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.output = self
        presenter.load(tableView: viperTableView)
        
    }
    
    //MARK: Background
    
    override func viewDidAppear(_ animated: Bool) {
        let backgroundImage = UIImage(named: "Granada")
        let imageView = UIImageView(image: backgroundImage)
        imageView.alpha = 0.5
        self.tableView.backgroundView = imageView
    }


    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.output.toDoList.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViperCell", for: indexPath)
        cell.textLabel?.text = presenter.output.toDoList[indexPath.row].name
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viperTableView.deselectRow(at: indexPath, animated: true)
         presenter.removeItems(tableView: viperTableView, indexRemove: presenter.output.toDoList[indexPath.row].index, index: indexPath.row)
    }

    @IBAction func addButton(_ sender: UIBarButtonItem) {
        present(presenter.alertVC(tableView: viperTableView), animated: true, completion: nil)
   
    }
}

extension ViperTableViewController: ViperPresenterOutput {

}
