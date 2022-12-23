//
//  ModelBookView.swift
//  Eduapp
//
//  Created by alaa gharbi on 11/12/2022.
//

import SwiftUI
import Foundation
struct ModelBookView: Decodable {
    var questions: [Result]
    
    struct Result: Decodable, Identifiable {
        // We need to set the ID inside of the closure, because the API doesn' return us an ID for each result
        var id: UUID {
            UUID()
        }
        var bookname: String
        var authorname: String
        var edition: String
        var degre: String
        var question: String
      //  var createdAt: String
       // var updateAt: String
       // var __v: Int
        
        var formattedQuestion: AttributedString {
            do {
                // Formatting the question with AttributedString, because API might return some markdown text - which will be hard to read if we keep the string as is
                return try AttributedString(markdown: bookname)
            } catch {
                // If we run into an error, return an empty string
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        var formattedauthorname: AttributedString {
            do {
                // Formatting the question with AttributedString, because API might return some markdown text - which will be hard to read if we keep the string as is
                return try AttributedString(markdown: authorname)
            } catch {
                // If we run into an error, return an empty string
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var formattededition: AttributedString {
            do {
                // Formatting the question with AttributedString, because API might return some markdown text - which will be hard to read if we keep the string as is
                return try AttributedString(markdown: edition)
            } catch {
                // If we run into an error, return an empty string
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var formatteddegre: AttributedString {
            do {
                // Formatting the question with AttributedString, because API might return some markdown text - which will be hard to read if we keep the string as is
                return try AttributedString(markdown: degre)
            } catch {
                // If we run into an error, return an empty string
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
       
        // Custom coding key, not included in the API response, so we need to set it inside the closure

//        var answers: [BookItm] {
//            do {
//                // Formatting all answer strings into AttributedStrings and creating an instance of Answer for each
//                let bookname = [Answer(text: try AttributedString(markdown: bookname), isCorrect: true)]
//                let authorname = [Answer(text: try AttributedString(markdown: authorname), isCorrect: false)]
//                let edition = [Answer(text: try AttributedString(markdown: edition), isCorrect: false)]
//                let degre = [Answer(text: try AttributedString(markdown: degre), isCorrect: false)]
//                // Merging the correct and incorrect arrays together
//                let allAnswers = bookname + authorname + edition + degre
//                // Shuffling the answers so the correct answer isn't always the first answer of the array
//                return allAnswers.shuffled()
//            } catch {
//                // If we run into an error, return an empty array
//                print("Error setting answers: \(error)")
//                return []
//            }
//        }
    }
}
