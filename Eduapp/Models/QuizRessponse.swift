//
//  QuizRessponse.swift
//  Eduapp
//
//  Created by alaa gharbi on 3/12/2022.
//

import Foundation
struct QuizResponse: Decodable {
    let questions: [Quiz]


    enum CodingKeys: String, CodingKey {
        case questions = "questions"
    }
}
