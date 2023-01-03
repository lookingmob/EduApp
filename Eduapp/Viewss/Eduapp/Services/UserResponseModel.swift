//
//  UserResponseModel.swift
//  EduApp
//
//  Created by alaa gharbi on 14/11/2022.
//

import Foundation
struct SignInRequest:Encodable {
    
    var email:String?
    var password:String?
}

struct SignUpRequest:Encodable {
    
    var  email : String?
    var  password:String?
    var  firstname : String?
    var  lastname : String?
    var  birthdate : String?
    var  sexe : String?
    var  idU : String?
}
struct studentBody: Decodable{
    
    var  _id : String
    var  firstname : String
    var  lastname : String
    var  birthdate : String
    var  sexe : String
    var  image : String
    var  email : String
    var  description : String
        
}
struct SignInResponseSuccess: Decodable{
    var success : Bool
    var message : String
    var token: String
    var student: studentBody
}
struct SignInResponseError: Decodable{
    var success : Bool
    var message : String
}

struct SignUpResponse: Decodable{
    var success : Bool
    var message : String
}

struct MailVerificationRequest:Encodable {
    var email:String?
}
struct Response: Decodable{
    var success : Bool
    var message : String
}
