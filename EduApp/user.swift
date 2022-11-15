//
//  user.swift
//  EduApp
//
//  Created by alaa gharbi on 12/11/2022.
//

import Foundation
struct User {
    let id : String
    let firstName : String
    let lastName : String
    let email : String
}
extension User: CustomDebugStringConvertible {
    var debugDescription: String {
        return """
ID : \(id)
First Name: \(firstName)
Last name: \(lastName)
Email: \(email)
"""
    }
}
