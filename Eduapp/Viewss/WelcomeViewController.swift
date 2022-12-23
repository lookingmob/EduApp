//
//  WelcomeViewController.swift
//  EduApp
//
//  Created by alaa gharbi on 11/11/2022.
//

import UIKit
import Alamofire
import AlamofireImage
import Lottie

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeimageview: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        AF.request("http://172.17.2.159:3000/quiz/",method: .get)
          .validate()
             .responseJSON{ apiResponse in
                 switch apiResponse.result{
                 case .success(_):
                     let apiDictionary = apiResponse.value as? [String:Any]
                   //  print("apiResponse --- \(apiDictionary.)")
                 case .failure(_):
                     print("got an error")
                 }
                 
             }
        
//
//            .responseDecodable(of: QuizResponse.self) { (response) in
//            guard let quizs = response.value else {
//                    return
//            }
//
//         do{
//             for quize in quizs.questions{
//                 print(quize)
//                 print("quize")
//
//               //  self.i = self.i+1
////                 dys["category"] = quize.category
////                 dys["question"] = quize.question
////
////                 print("-----------")
////               //  print(dys["image"]!)
////                 print("------------------")
////                 print(dys["category"])
////                 print("///////////////////")
////                 print(dys["question"])
////                 obs[String(self.i)] = dys
////             print(quizs)
//              }
////             print(obs)
////             print("-------")
//            }
//           //     self.dic.accept(obs)
//              //  print("1111111")
//
//            }
//        let urlsimg = "http://172.17.2.159:4000/profile/profile_1669212189916.png"
//        let url = URL(string: urlsimg)
//        print(url)
//        self.welcomeimageview.af.setImage(withURL: url!)
        
        
//        AF.request(URL,method: .post,parameters: ["username": "tigana",
//        "email": "ala.gharbi@esprit.tn",
//        "password": "123456"
//        ]
//        ,encoding: JSONEncoding.default)
//          .validate()
//         .responseJSON{ (data) in
//             print(data)
//             print("---")
//         }
    
//        AF.request("http://the-trivia-api.com/api/questions",method: .get,encoding: JSONEncoding.default)
//            .validate()
//            .responseJSON{
//                (data) in
//                print("data")
//                print("-----")
//            }
//
        
//
//        AF.request(URL+"login",method: .post,parameters: ["email": "ala.gharbi@esprit.tn","password" : "12345678910"],encoding: JSONEncoding.default)
//          .validate()
//          .responseJSON{ (data) in
//              print(data)
//          }
//
        
        
//        AF.request(URL+"6372e756c022d98b7c9dd38f",method: .patch,parameters: ["email": "tirairai@gmail.com","password" : "123456"],encoding: JSONEncoding.default)
//          .validate()
//          .responseJSON{ (data) in
//              print(data)
//          }
        
        
        
//       if( UserViewModel().profile())
//        {
//           print("profile succes")
//           print("--------------")
//           print(UserDefaults.standard.dictionaryRepresentation())
//           print("--------------")
//       }
        
    }
    

//     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzcyZTc1NmMwMjJkOThiN2M5ZGQzOGYiLCJpYXQiOjE2Njg0NzU3OTV9.8T-CXof233kKn6jRzvhdZ3PayRRJlStoWEJcBeRJnsc"
}


//    token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzdjM2JkZmUzNzFhNmIzNDNjODhiOTMiLCJpYXQiOjE2NjkwODY1NTd9.hpdPhe6NV9DpEZcx531s7To7AdsSigI7SzbAMv4WxKo";
//user =     {
//    "__v" = 0;
//    "_id" = 637c3bdfe371a6b343c88b93;
//    createdAt = "2022-11-22T03:02:55.310Z";
//    email = "ala.gharbi@esprit.tn";
//    otpCode = 3065;
//    password = "$2b$10$Fe5fIg1xl5e51gXl1mCA4O4J9QnfDyDNBt74Xf1GPF4nCiJpDZvnO";
//    role = user;
//    updatedAt = "2022-11-22T03:02:55.310Z";
//    username = tigana;
//};



