//
//  UserRegister.swift
//  EduApp
//
//  Created by alaa gharbi on 15/11/2022.
//

import Foundation
struct UserRegister: Decodable {
    let username: String
    let email: String
    let password: String
    let role: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case username = "username"
        case email = "email"
        case password = "password"
        case role = "role"
        case id = "_id"
    }
}
