//
//  MVVMViewModel.swift
//  ToDoApp
//
//  Created by Роман далинкевич on 22.03.2021.
//

import Foundation

class MVVM_ViewModel {
    let toDoItems = MVVMRealmManager.shared.getItems()
    let manager = MVVMRealmManager()
    let newToDoItems = MVVMToDoItems()
    
}
