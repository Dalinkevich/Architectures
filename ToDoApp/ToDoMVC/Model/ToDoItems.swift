//
//  ToDoItems.swift
//  ToDoApp
//
//  Created by Роман далинкевич on 18.03.2021.
//

import Foundation
import RealmSwift


class ToDoItems: Object {
    @objc dynamic var name = ""
    @objc dynamic var done = false
}
