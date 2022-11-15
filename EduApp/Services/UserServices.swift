

import Foundation
import Alamofire

class UserService{
    
    static let shared = UserService()
    
        
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
                    yo = registeuser.user.id
                }
                
            }
        return yo
        // return " "
    }
    func getProfile() -> String {
        var p = ""
        let URL = "http://172.17.0.155:3000/user/"
        let headers: HTTPHeaders = [.authorization(bearerToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzcyZTc1NmMwMjJkOThiN2M5ZGQzOGYiLCJpYXQiOjE2Njg0NzU3OTV9.8T-CXof233kKn6jRzvhdZ3PayRRJlStoWEJcBeRJnsc")]
        AF.request(URL+"profile",method: .get,parameters: ["email": "tirairai@gmail.com","password" : "123456"],headers: headers)
            .validate()
            .responseDecodable(of: UserProfile.self) { (response) in
                guard let registeuser = response.value else {
                    return
                }
                do{
                    print("------------")
                  
                    print("//////////////")
                    print(registeuser)
print("-----------------------------")
                    UserDefaults.standard.set(registeuser.username as? String, forKey: "username")
                    UserDefaults.standard.set(registeuser.email as? String, forKey: "email")
                    UserDefaults.standard.set(registeuser.id, forKey: "id")
                    print("-----------------------------")

                    //      yo = registeuser.token
                    print(UserDefaults.standard.dictionaryRepresentation().values)
                    print(UserDefaults.standard.dictionaryRepresentation().keys)
                    p = registeuser.id
                }
            }
        return p
        
        
        
    
        
    }
}
