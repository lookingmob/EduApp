//
//  QuizModel.swift
//  Eduapp
//
//  Created by alaa gharbi on 4/12/2022.
//

import Foundation
struct QuizModel: Decodable {
    var questions: [Result]
    
    struct Result: Decodable, Identifiable {
        // We need to set the ID inside of the closure, because the API doesn' return us an ID for each result
        var id: UUID {
            UUID()
        }
        var category: String
        var correctanswer: String
        var incorrectanswer1: String
        var incorrectanswer2: String
        var incorrectanswer3: String
        var question: String
      //  var createdAt: String
       // var updateAt: String
       // var __v: Int
        
        var formattedQuestion: AttributedString {
            do {
                // Formatting the question with AttributedString, because API might return some markdown text - which will be hard to read if we keep the string as is
                return try AttributedString(markdown: question)
            } catch {
                // If we run into an error, return an empty string
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        // Custom coding key, not included in the API response, so we need to set it inside the closure

        var answers: [Answer] {
            do {
                // Formatting all answer strings into AttributedStrings and creating an instance of Answer for each
                let correct = [Answer(text: try AttributedString(markdown: correctanswer), isCorrect: true)]
                let incorrectans = [Answer(text: try AttributedString(markdown: incorrectanswer1), isCorrect: false)]
                let incorrectanser = [Answer(text: try AttributedString(markdown: incorrectanswer2), isCorrect: false)]
                let incorrect = [Answer(text: try AttributedString(markdown: incorrectanswer3), isCorrect: false)]
                // Merging the correct and incorrect arrays together
                let allAnswers = correct + incorrectans + incorrectanser + incorrect
                // Shuffling the answers so the correct answer isn't always the first answer of the array
                return allAnswers.shuffled()
            } catch {
                // If we run into an error, return an empty array
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
}
