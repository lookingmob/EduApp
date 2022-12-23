//
//  Book.swift
//  Eduapp
//
//  Created by alaa gharbi on 29/11/2022.
//

import Foundation
import SwiftUI
struct Book:Identifiable,Codable, Hashable{
   
    
   // var image : String = ""
    var id: String
   var bookname: String
    var authname: String
 var edition: String
var degre: String
    var image: String
    
    var price: Int
    init(id: String , bookname:String , authname:String , edition: String, degre: String,image: String,price : Int) {

        self.id = id
        self.bookname = bookname
        self.authname =  authname
        self.edition = edition
        self.degre = degre
        self.image = image
        self.price = price
    }

    enum CodingKeys:String, CodingKey{
        case id = "_id"
        case bookname
        case authname
        case edition
        case degre
        case image
        case price
    }
    struct BookViewModel:Codable{
        let books:[Book]
    }
}
