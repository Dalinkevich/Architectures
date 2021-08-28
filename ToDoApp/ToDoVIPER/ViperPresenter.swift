//
//  ViperPresenter.swift
//  ToDoApp
//
//  Created by Роман далинкевич on 23.03.2021.
//

import Foundation
import UIKit

protocol ViperPresenterInput {
    var output: ViperPresenterOutput! { get set }
    func load(tableView: UITableView)
    func alertVC(tableView: UITableView) -> UIAlertController
    func removeItems(tableView: UITableView, indexRemove: Int, index: Int)
}

protocol ViperPresenterOutput {
    var toDoList: [ViperItems] { get set }
}


class ViperPresrnter: ViperPresenterInput, ViperInteractorOutput {
    
    var toDoList: [ViperItems] = []
    var output: ViperPresenterOutput!
    var index = 0
    var interactor: ViperInteractorInput = ViperInteractor()
    
    func load(tableView: UITableView) {
        toDoList = interactor.getItems()
        output.toDoList = toDoList
        tableView.reloadData()
    }
    //MARK: AlertController
    
    func alertVC(tableView: UITableView) -> UIAlertController {
        let alertVC = UIAlertController(title: "New ToDo", message: "What do you want to do?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let addAction = UIAlertAction(title: "ADD", style: .default) { [self] alertAction in
            let toDoItemTextField = alertVC.textFields?.first
            if let newToDoListItem = toDoItemTextField?.text {
                toDoList.append(ViperItems.setViperItems(name: newToDoListItem, index: index))
                interactor.save(item: toDoList)
                output.toDoList = toDoList
                index += 1
                tableView.reloadData()
            }
        }
        alertVC.addTextField { UITextField in }
        alertVC.addAction(addAction)
        alertVC.addAction(cancelAction)
        
        return alertVC
    }

    func removeItems(tableView: UITableView, indexRemove: Int, index: Int) {
        toDoList.remove(at: index)
        output.toDoList = toDoList
        interactor.remove(index: indexRemove)
        tableView.reloadData()
    }
    
    
}

