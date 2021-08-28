//
//  MVVMRealmManager.swift
//  ToDoApp
//
//  Created by Роман далинкевич on 22.03.2021.
//

import Foundation
import RealmSwift


class MVVMRealmManager {
    
    static let shared = MVVMRealmManager()
    
    var realm = try! Realm()
    
    func save(item: MVVMToDoItems) {
        try! realm.write {
            let newItem = MVVMToDoItems()
            newItem.name = item.name
            newItem.done = item.done
            realm.add(newItem)
        }
    }
    
    func getItems() -> Results<MVVMToDoItems> {
        realm.objects(MVVMToDoItems.self)
    }
    
    func remove(index: Int) {
        let item = realm.objects(MVVMToDoItems.self)[index]
        try! realm.write {
            realm.delete(item)
        }
    }
}
