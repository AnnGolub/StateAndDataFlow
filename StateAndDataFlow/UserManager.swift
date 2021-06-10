//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 08.06.2021.
//

import Combine

class UserManger: ObservableObject {
    @Published var isRegister = false
    var name = ""
}
