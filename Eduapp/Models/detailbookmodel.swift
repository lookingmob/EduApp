//
//  detailbookmodel.swift
//  Eduapp
//
//  Created by alaa gharbi on 12/12/2022.
//


import Foundation
import SwiftUI
struct detailbookmodel:Identifiable,Codable, Hashable{
   
    
   // var image : String = ""
    var id: String
   var bookname: String
    var authname: String
 var edition: String
var degre: String
    var pdf: String
    var rating: Int
 
    init(id: String , bookname:String , authname:String , edition: String, degre: String,pdf: String, rating: Int) {

        self.id = id
        self.bookname = bookname
        self.authname =  authname
        self.edition = edition
        self.degre = degre
        self.pdf = pdf
        self.rating = rating
    }

    enum CodingKeys:String, CodingKey{
        case id = "_id"
        case bookname
        case authname
        case edition
        case degre
        case pdf
        case rating
    }
    struct detailbookmodel:Codable{
        let books:[Book]
    }
}
