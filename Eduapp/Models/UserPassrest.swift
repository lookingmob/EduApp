//
//  UserPassrest.swift
//  EduApp
//
//  Created by alaa gharbi on 22/11/2022.
//

import Foundation
struct UserChangePasswordJson: Decodable {
    //let token: String
    let user : UserProfileVersion
    

    enum CodingKeys: String, CodingKey {
     //   case token = "token"
       case user = "user"
      

    }
}
