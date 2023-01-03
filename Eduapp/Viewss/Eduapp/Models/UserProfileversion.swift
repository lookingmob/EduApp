//
//  UserProfileversion.swift
//  EduApp
//
//  Created by alaa gharbi on 22/11/2022.
//

import Foundation
struct UserProfileVersion: Decodable {
    let id: String
    let username: String
    let email: String
 //   let role: String
    let otpCode: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username = "username"
        case email = "email"
    //case role = "role"
        case otpCode
  
    }
}
