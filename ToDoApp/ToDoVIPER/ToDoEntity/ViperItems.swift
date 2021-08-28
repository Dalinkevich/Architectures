//
//  ViperItems.swift
//  ToDoApp
//
//  Created by Роман далинкевич on 24.03.2021.
//

import Foundation
import RealmSwift

class ViperItems: Object {
    @objc dynamic var name = String()
    @objc dynamic var index = Int()
    
    static func setViperItems(name: String, index: Int) -> ViperItems {
        let items = ViperItems()
        items.name = name
        items.index = index
        
        return items
    }
}



