//
//  QuizzBrain.swift
//  Eduapp
//
//  Created by alaa gharbi on 2/12/2022.
//

import Foundation
import UIKit
struct QuizzBrain {
    let questions = [Question(text: "almaniya is renni renni", answer: "true", wrongAnswer1: "idk", wrongAnswer2: "false", wrongAnswer3: "maybe", color: UIColor.red, image: UIImage(named: "welcome")!),
            Question(text: "almaniya is roror renni", answer: "tcho", wrongAnswer1: "idk", wrongAnswer2: "false", wrongAnswer3: "maybe", color: UIColor.red, image: UIImage(named: "welcome")!),
            Question(text: "almaniya is rarar renni", answer: "tchi", wrongAnswer1: "idk", wrongAnswer2: "false", wrongAnswer3: "maybe", color: UIColor.red, image: UIImage(named: "welcome")!),
            Question(text: "almaniya is rarr renni", answer: "tcha", wrongAnswer1: "idk", wrongAnswer2: "false", wrongAnswer3: "maybe", color: UIColor.red, image: UIImage(named: "welcome")!),
    ]
    
    
    var numQuestion = 0
    var score = 0
    mutating func checkAnswer(userAnswer : String) -> Bool {
        if userAnswer == questions[numQuestion].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
    return score
    }

    mutating func getTextQuestion ( ) -> String {
        return questions [numQuestion].text
    }
    func getProgress () -> Float {
    let progress = Float (numQuestion + 1) / Float (questions.count)
    return progress
    }
    mutating func getResponse1 ( ) -> String {
        return questions [numQuestion].wrongAnswer1
    }
    mutating func getResponse2 ( ) -> String {
        return questions [numQuestion].wrongAnswer2
    }
    mutating func getResponse3 ( ) -> String {
        return questions [numQuestion].wrongAnswer3
    }
    mutating func getResponse ( ) -> String {
        return questions [numQuestion].answer
    }
    func getColor ( ) -> UIColor {
        return questions [numQuestion].color
    }
    func getImage () -> UIImage {
    return questions [numQuestion].image
    }
       mutating func nextQuestion() -> Bool {
            if numQuestion + 1 < questions .count {
                numQuestion += 1
                return false
            } else {
                numQuestion = 0
                return true
            }
            
        }
}
