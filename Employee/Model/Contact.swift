//
//  Contact.swift
//  Employee
//
//  Created by Karthik on 15/04/21.
//

import Foundation

// MARK: - Welcome
struct Root : Codable {
    let result: [User]
}

// MARK: - Result
struct User: Codable {
    var id: Int
    var firstname, lastname, birthday, age: String
    var email, mobileno, address, contactperson: String
    var cpmobileno: String
}
