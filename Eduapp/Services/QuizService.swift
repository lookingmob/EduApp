//
//  QuizService.swift
//  Eduapp
//
//  Created by alaa gharbi on 30/11/2022.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa
class QuizService{
    static let shared = QuizService()
       var URL = ""
       var i = -1
    let dic = BehaviorRelay<Dictionary<String,Dictionary<String,String>>>(value: [:])


      private init() {
         //  URL = "https://www.googleapis.com/books/v1/volumes?q=harry+potter"
 //       URL = "http://172.17.2.159:3000/quiz/"
       }
       func getQuizs(){
//        var observer = [String : Dictionary<String,Dictionary<String,String>>]()
        var obs = [String : Dictionary<String,String>] ()
        var dys = [String : String] ()
           AF.request(Consts.URLquiz,method: .get)
             .validate()
//             .responseJSON{ (data) in
//                 print(data)
//             }

               .responseDecodable(of: QuizResponse.self) { (response) in
               guard let quizs = response.value else {
                   print(response.error)
                       return
               }

            do{
                for quize in quizs.questions{
                    self.i = self.i+1
                    dys["category"] = quize.category
                    dys["question"] = quize.question
                    dys["id"] = quize.id
                    dys["incorrectAnswer1"] = quize.incorrectanswer1
                    dys["incorrectAnswer2"] = quize.incorrectanswer2
                    dys["incorrectAnswer3"] = quize.incorrectanswer3
                    dys["answer"] = quize.correctAnswer
                    //dys["image"] = quize.image ?? "hihi.jpg"
                    print("-----------")
                  //  print(dys["image"]!)
                    print("------------------")
                    //print(dys["category"]!)
                    print("__________________")
                    print(dys["question"]!)
                    obs[String(self.i)] = dys
                    // observer[String(self.i)] = obs
                    }
                 print("---------------------")
                 print(obs)
                 print("---------------------")
                }
                    self.dic.accept(obs)
                    print(obs)
                    
                }
         
        }
    func  getQuiz(val : String) -> Dictionary<String,String>
{
        return     self.dic.value[val]!

    }
    func addSinString(string: String) -> String{
       var string1 = string
    ///let size = string.count
        //let string2 = string.suffix(size - 4)
        let ch :Character = "s"
        let i = string.index(string.startIndex, offsetBy: 4)
        string1.insert(ch, at:  i)
    return string1
    }
}
