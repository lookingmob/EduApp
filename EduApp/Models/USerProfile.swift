//
//  USerProfile.swift
//  EduApp
//
//  Created by alaa gharbi on 15/11/2022.
//

import Foundation
struct UserProfile: Decodable {
    let id: String
    let email: String
    let role: String
    let username: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case email = "email"
        case role = "role"
        case username = "username"
    }
}
