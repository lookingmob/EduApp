//
//  Utilisateur.swift
//  Eduapp
//
//  Created by alaa gharbi on 9/12/2022.
//

import Foundation

struct Utilisateur {
    
    internal init(_id: String? = nil, username: String? = nil, email: String? = nil) {
        self._id = _id
        self.username = username
        self.email = email
    //    self.password = password
//        self.nom = nom
//        self.prenom = prenom
     //   self.dateNaissance = dateNaissance
       // self.idPhoto = idPhoto
       // self.sexe = sexe
      //  self.score = score
       // self.bio = bio
      //  self.isVerified = isVerified
       // self.blockedUsers = blockedUsers
       // self.blockedPosts = blockedPosts
    }
    
    var _id : String?
    var username : String?
    var email : String?
 //   var password  : String?
//    var nom : String?
//    var prenom : String?
//    var dateNaissance : Date?
 //   var idPhoto : String?
//    var sexe : Bool?
//    var score : Int?
//    var bio : String?
//    var isVerified : Bool?
    
    // relations
    //var blockedUsers : [String]?
    //var blockedPosts : [String]?
}
