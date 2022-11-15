//
//  registerResponseUser.swift
//  EduApp
//
//  Created by alaa gharbi on 15/11/2022.
//

import Foundation
struct RegisterResponseUser: Decodable {
    let message: String
    let doc: UserRegister
    

    enum CodingKeys: String, CodingKey {
        case message = "message"
        case doc = "docs"
      

    }
}
