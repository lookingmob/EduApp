//
//  UserLogin.swift
//  EduApp
//
//  Created by alaa gharbi on 15/11/2022.
//

import Foundation
struct UserLogin: Decodable {
    let id: String
    let username: String
    let email: String
    let password: String
    let role: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username = "username"
        case email = "email"
        case password = "password"
        case role = "role"
    }
}
