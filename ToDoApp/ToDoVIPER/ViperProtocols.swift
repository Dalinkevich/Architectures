//
//  Protocols.swift
//  ToDoApp
//
//  Created by Роман далинкевич on 27.03.2021.
//

import Foundation


protocol ViperViewProtocol: class {
    func showToDoList(with items: [String])
}

protocol ViperInteractorOutputProtocol: class {
    func toDoListDidfetch(items: [String])
}

protocol ViperInteractorInputProtocol {
    
    var presenter: ViperInteractorOutputProtocol? { get set }
    
    func getItems()
    func addItems(items: String)
    func removeItems(id: Int)
}

protocol ViperPresenterProtocol: class {
    
    var view: ViperViewProtocol? { get set }
    var interactor: ViperInteractorInputProtocol? { get set }
    
    func viewDidLoad()
    func addNewItems(items: String)
    func removeItems(id: Int)
}
