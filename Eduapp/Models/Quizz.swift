//
//  Quizz.swift
//  Eduapp
//
//  Created by alaa gharbi on 30/11/2022.

import Foundation
struct Quiz: Decodable {
    let id: String?
    let category: String?
    let correctAnswer: String?
    let incorrectanswer1: String?
    let incorrectanswer2: String?
    let incorrectanswer3: String?
    let question: String?
  //  let image: String?
  


    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case category = "category"
        case correctAnswer = "correctanswer"
       // case incorrectAnswer = "incorrectAnswers"
        case incorrectanswer1 = "incorrectanswer1"
        case incorrectanswer2 = "incorrectanswer2"
        case incorrectanswer3 = "incorrectanswer3"
        case question = "question"
  //      case type = "type"
       // case image = "image"
    }
}
