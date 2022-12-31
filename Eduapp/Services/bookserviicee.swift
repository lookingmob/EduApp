/*
import Foundation

import Alamofire
import RxSwift
import RxCocoa
class bookserviicee{
    static let shared = bookserviicee()
       var URL = ""
       var i = -1
    let dic = BehaviorRelay<Dictionary<String,Dictionary<String,String>>>(value: [:])


      private init() {
         //  URL = "https://www.googleapis.com/books/v1/volumes?q=harry+potter"
        URL = "http://172.17.1.81:3000/book/"
       }
       func getbooks(){
//        var observer = [String : Dictionary<String,Dictionary<String,String>>]()
        var obs = [String : Dictionary<String,String>] ()
        var dys = [String : String] ()
           AF.request("http://172.17.1.81:3000/book/",method: .get)
             .validate()
//             .responseJSON{ (data) in
//                 print(data)
//             }

               .responseDecodable(of: BookiResponse.self) { (response) in
               guard let books = response.value else {
                   print(response.error)
                       return
               }

            do{
                for book in books.questions{
                    self.i = self.i+1
                    dys["bookname"] = book.bookname
                    dys["edition"] = book.edition
                    print("-----------")
                  //  print(dys["image"]!)
                    print("------------------")
                    print(dys["bookname"]!)
                    print("///////////////////")
                    print(dys["edition"]!)
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
*/
