//
//  bookViewModel.swift


import Foundation
import Alamofire
import SwiftyJSON
class bookViewModel : ObservableObject{
    
    //let BookService : BookService = BookService()
    
    @Published var books = [Book]()
    @Published var detailbook = [detailbookmodel]()
  
    @Published var bookDetail: BookModel?
    /*
     init() {
     getAllBooks(complited: {(success , respnse)in
     if success{
     let bookList = respnse!
     print("ahyaaaaa",bookList)
     }else {
     print("error cant connect ")
     }
     
     })
     }
     func getAllBooks(complited: @escaping(Bool, [Book]?) -> Void) {
     
     
     AF.request("http://172.17.2.159:3000/book/" , method: .get ,encoding: JSONEncoding.default)
     .validate(statusCode: 200..<500)
     .validate(contentType: ["application/json"])
     .responseData {
     response in
     switch response.result {
     case .success:
     print(response.value)
     
     for singleJsonItem in JSON(response.data!){
     
     self.bookList.append(self.makeItem(jsonItem:singleJsonItem.1))
     }
     
     complited(true,self.bookList)
     case let .failure(error):
     debugPrint(error)
     complited(false,nil)
     }
     }
     
     }
     
     func makeItem(jsonItem : JSON) -> Book {
     return Book(id: jsonItem["_id"].stringValue,
     bookname: jsonItem["bookname"].stringValue,
     authname: jsonItem["authname"].stringValue,
     edition: jsonItem["edition"].stringValue,
     degre: jsonItem["degre"].stringValue)
     
     }*/
    
    func getAllBooks(){
        
        guard let url = URL(string:"http://172.17.2.159:3000/book/") else {
            
            print("not found")
            
            return
            
        }
        
        
        
        URLSession.shared.dataTask(with: url) {
            
            (data , res , error) in
            
            if error != nil
                
            {
                
                print ("error", error?.localizedDescription ?? "")
                
                return
                
            }
            
            do {
                
                if let data = data {
                    //  print(String(data:data,encoding: .utf8)as Any)
                    
                    let result = try JSONDecoder().decode([Book].self, from: data)
                    
                    DispatchQueue.main.async {
                        
                      self.books = result
                        
                        print(self.books)
                        
                    }
                    
                    
                    
                }
                
                else {
                    
                    print ("no data")
                    
                }
                
            } catch let JsonError {
                
                
                
                print("fetch json error :", JsonError.localizedDescription)
                
                print(String(describing: JsonError))
                
                
                
            }
            
        }.resume()
        
    }
    
    
    
    
    
    
    func getBook(){
        
        guard let url = URL(string:"http://172.17.2.159:3000/book/detailsbook") else {
            
            print("not found")
            
            return
            
        }
        
        
        
        URLSession.shared.dataTask(with: url) {
            
            (data , res , error) in
            
            if error != nil
                
            {
                
                print ("error", error?.localizedDescription ?? "")
                
                return
                
            }
            
            do {
                
                if let data = data {
                    //  print(String(data:data,encoding: .utf8)as Any)
                    
                    let result = try JSONDecoder().decode([detailbookmodel].self, from: data)
                    
                    DispatchQueue.main.async {
                        
                      self.detailbook = result
                        
                        print(self.detailbook)
                        
                    }
                    
                    
                    
                }
                
                else {
                    
                    print ("no data")
                    
                }
                
            } catch let JsonError {
                
                
                
                print("fetch json error :", JsonError.localizedDescription)
                
                print(String(describing: JsonError))
                
                
                
            }
            
        }.resume()
        
    }
    
    
}
