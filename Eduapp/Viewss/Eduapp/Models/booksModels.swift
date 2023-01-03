//
//  booksModels.swift

import Foundation
import SwiftUI

struct booksModels: Identifiable, Codable, Hashable {
    
    var id : String
    var bookname : String
    var authname : String
    var edition : String
    var degre : String
   // var image : String

    init(id: String,bookname: String, authname: String, edition: String,
    // image: String,
degre: String) {
        
        self.id = id
        self.bookname = bookname
        self.authname = authname
        self.edition = edition
       // self.image = image
        self.degre = degre
    }
    
    enum CodingKeys: String, CodingKey {
        
        case id = "_id"
        case bookname
        case authname
        case edition
       // case image
        case degre
    }
    struct  booksDataModel:Codable{
        let books:[booksModels]
    }}
