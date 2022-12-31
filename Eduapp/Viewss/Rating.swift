//
//  Rating.swift
//  Eduapp
//
//  Created by alaa gharbi on 30/12/2022.
//
import Foundation

struct RatingUserProduct: Codable


{

    internal init(_id: String? = nil, idUser: String? = nil, idBook: String? = nil,rating: Int? = nil) {

        self._id = _id

        self.idUser = idUser

        self.idBook = idBook

        self.rating = rating

        

    }

    

    var _id :String?

    var idUser :String?

    var idBook :String?

    var rating :Int?

    

}
