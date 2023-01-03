//
//  BookItm.swift
//  Eduapp
//
//  Created by alaa gharbi on 11/12/2022.
//

import Foundation
struct BookItm: Identifiable {
    var id = UUID() // Setting the UUID ourselves inside of the model, because API doesn't return a unique ID for each answer
    var text: AttributedString
    var isCorrect: Bool
}
