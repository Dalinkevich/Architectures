//
//  RealmManager.swift
//  ToDoApp
//
//  Created by Роман далинкевич on 18.03.2021.
//

import Foundation
import RealmSwift


class RealmManager {
    
    static let shared = RealmManager()
    
    var realm = try! Realm()
    
    func save(item: ToDoItems) {
        try! realm.write {
            realm.add(item)
        }
    }
    
    func getItems() -> Results<ToDoItems> {
        realm.objects(ToDoItems.self)
    }
    
    func remove(index: Int) {
        let item = realm.objects(ToDoItems.self)[index]
        try! realm.write {
            realm.delete(item)
        }
    }
}

