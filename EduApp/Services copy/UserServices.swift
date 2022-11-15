

import Foundation
import Alamofire

class UserService{
    
    static let shared = UserService()
    //  var URL = ""
    //   var i = -1
    //    let dic = BehaviorRelay<Dictionary<String,String>>(value: [:])
    
    
    //      private init() {
    //         //  URL = "https://www.googleapis.com/books/v1/volumes?q=harry+potter"
    //   var URL = "172.17.11.169:3000/user/"
    //          // URL = "https://www.googleapis.com/books/v1/volumes?q=flowers&key=AIzaSyDGAJwt_KY9lhuvSk61F9fwPbsJ-I6EdmA"
    //       }
    
    
    
    func SignIn(urlStr:String,userusername:String,useremail:String,userpassword:String) -> String
    {
        var yo = ""
        AF.request(urlStr,method: .post,parameters: ["username": userusername,"email": useremail,"password" : userpassword],encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: RegisterResponseUser.self) { (response) in
                guard let registeuser = response.value else {
                    return
                }
                do{
                    
                    print(registeuser.message)
                    print(registeuser.doc.email)
                    print(registeuser.doc.id)
                    print("//////////////")
                    print(registeuser)
                    yo = registeuser.message
                }
                
            }
        return yo
    }
    
    func LogIn(urlStr:String,useremail:String,userpassword:String) -> String
    {        let URL = "http://172.17.0.155:3000/user/"
        var yo = ""
        AF.request(URL+"login",method: .post,parameters: ["email": useremail,"password" : userpassword],encoding: JSONEncoding.default)
            .validate()
        //                  .responseJSON{ (data) in
        //                      print(data)
        //                  }
            .responseDecodable(of: UserLoginJson.self) { (response) in
                guard let registeuser = response.value else {
                    return
                }
                do{
                    print("------------")
                    print(registeuser.token)
                    // print(registeuser.user.id)
                    //   print(registeuser.doc.id)
                    print("//////////////")
                    print(registeuser)
                    UserDefaults.standard.set(registeuser.token as? String, forKey: "token")
                    UserDefaults.standard.set(registeuser.user.id, forKey: "id")
                    //      yo = registeuser.token
                    yo = registeuser.user.id
                }
                
            }
        return yo
        // return " "
    }
    func getProfile() -> String {
        var p = ""
        let URL = "http://172.17.0.155:3000/user/"
        //  let headers: HTTPHeaders = [.authorization(bearerToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzcyZTc1NmMwMjJkOThiN2M5ZGQzOGYiLCJpYXQiOjE2Njg0NzU3OTV9.8T-CXof233kKn6jRzvhdZ3PayRRJlStoWEJcBeRJnsc")]
        let headers: HTTPHeaders = [.authorization(bearerToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzcyZTc1NmMwMjJkOThiN2M5ZGQzOGYiLCJpYXQiOjE2Njg0NzU3OTV9.8T-CXof233kKn6jRzvhdZ3PayRRJlStoWEJcBeRJnsc")]
        AF.request(URL+"profile",method: .get,parameters: ["email": "tirairai@gmail.com","password" : "123456"],headers: headers)
            .validate()
            .responseDecodable(of: UserProfile.self) { (response) in
                guard let registeuser = response.value else {
                    return
                }
                do{
                    print("------------")
                    //    print(registeuser.token)
                    // print(registeuser.user.id)
                    //   print(registeuser.doc.id)
                    print("//////////////")
                    print(registeuser)
                    UserDefaults.standard.set(registeuser.username as? String, forKey: "username")
                    UserDefaults.standard.set(registeuser.email as? String, forKey: "email")
                    UserDefaults.standard.set(registeuser.id, forKey: "id")
                    //      yo = registeuser.token
                    p = registeuser.id
                }
            }
        return p
        
        //  UserDefaults.standard.string(forKey: "token")
        
        
        //    func SignUp(urlStr:String,httpMethod:String,headerFields:[String:String] = [:],signUpRequest: SignUpRequest) async throws -> Any?
        //    {
        //        guard let url = URL(string: urlStr ) else { return nil }
        //        var urlReqest = URLRequest(url: url)
        //        urlReqest.allHTTPHeaderFields = headerFields
        //        urlReqest.httpMethod = httpMethod
        //        urlReqest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //      urlReqest.timeoutInterval = 5
        //
        //
        //        let codedData = try JSONEncoder().encode(signUpRequest)
        //        urlReqest.httpBody = codedData
        //
        //        let (data,response) = try await URLSession.shared.data(for: urlReqest)
        //
        //        if let response = (response as? HTTPURLResponse)
        //        {
        //
        //            if response.statusCode == 200
        //            {
        //
        //                let decodedData = try JSONDecoder().decode(SignUpResponse.self, from: data)
        //
        //                return decodedData
        //            }else if response.statusCode == 400{
        //                let decodedErorrData = try JSONDecoder().decode(SignUpResponse.self, from: data)
        //                return decodedErorrData
        //            }
        //        }
        //        return nil;
        //    }
        //    ///
        //   func VerifyMail(urlStr:String,httpMethod:String,headerFields:[String:String] = [:],mailVerificationRequest: MailVerificationRequest) async throws -> Any?
        //    {
        //        guard let url = URL(string: urlStr ) else { return nil }
        //        var urlReqest = URLRequest(url: url)
        //        urlReqest.allHTTPHeaderFields = headerFields
        //        urlReqest.httpMethod = httpMethod
        //        urlReqest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //      urlReqest.timeoutInterval = 5
        //
        //
        //        let codedData = try JSONEncoder().encode(mailVerificationRequest)
        //        urlReqest.httpBody = codedData
        //
        //        let (data,response) = try await URLSession.shared.data(for: urlReqest)
        //
        //        if let response = (response as? HTTPURLResponse)
        //        {
        //
        //            if response.statusCode == 200 || response.statusCode == 400
        //            {
        //
        //                let decodedData = try JSONDecoder().decode(Response.self, from: data)
        //
        //                return decodedData
        //            }
        //        }
        //        return nil
        //    }
        
        
    }
}
