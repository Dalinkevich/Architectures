//
//  MVVMToDoItems.swift
//  ToDoApp
//
//  Created by Роман далинкевич on 22.03.2021.
//

import Foundation
import RealmSwift


class MVVMToDoItems: Object {
    @objc dynamic var name = ""
    @objc dynamic var done = false
}
