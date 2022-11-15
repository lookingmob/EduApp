//
//  User.swift
//  EduApp
//
//  Created by alaa gharbi on 14/11/2022.
//

import Foundation
struct User: Decodable {
    let username: String
    let email: String
    let password: String
    let role: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case username
        case email
        case password
        case role
        case id

    }
}
