//
//  UserLoginJson.swift
//  EduApp
//
//  Created by alaa gharbi on 15/11/2022.
//

import Foundation
struct UserLoginJson: Decodable {
    let token: String
    let user : UserRegister
    

    enum CodingKeys: String, CodingKey {
        case token = "token"
       case user = "user"
      

    }
}
