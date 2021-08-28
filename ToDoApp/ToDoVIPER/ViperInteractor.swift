//
//  ViperInteractor.swift
//  ToDoApp
//
//  Created by Роман далинкевич on 23.03.2021.
//

import Foundation
import RealmSwift


protocol ViperInteractorInput {
    func save(item: [ViperItems])
    func getItems() -> [ViperItems]
    func remove(index: Int)
}

protocol ViperInteractorOutput {
//    var toDoList: [ViperItems] { get set }
}

//MARK: Realm

class ViperInteractor: ViperInteractorInput {
    
    var toDoList: [ViperItems] = []
    let realm = try! Realm()
    
    func save(item: [ViperItems]) {
        for el in item {
            try! realm.write {
                realm.add(el)
            }
        }
    }
    
    func getItems() -> [ViperItems] {
        for el in realm.objects(ViperItems.self) {
            if !el.name .isEmpty {
                toDoList.append(el)
            }
        }
        return toDoList
    }
    
    func remove(index: Int) {
        let item = realm.objects(ViperItems.self)
        for el in item {
            if el.index == index {
                try! realm.write {
                    realm.delete(el)
                }
            }
        }
    }
    
}
