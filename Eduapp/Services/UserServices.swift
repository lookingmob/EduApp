

import Foundation
import Alamofire

class UserService{
    
  //  static let shared = UserService()
   // static var URL =  "http://172.17.1.81:3000/user/"

        
    func SignIn(userusername:String,useremail:String,userpassword:String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void)    {
    let URL =  "http://172.17.1.81:3000/user/"
        AF.request("http://172.17.1.81:3000/user/register",method: .post,parameters: ["username": userusername,"email": useremail,"password" : userpassword],encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: RegisterResponseUser.self) { (response) in
                guard let registeuser = response.value else {
                    onError("email already existe")
                    return
                }
                do{
                    
                    print(registeuser.message)
                    print(registeuser.doc.email)
                    print(registeuser.doc.id)
                    print("//////////////")
                    print(registeuser)
                    onSuccess()
                }
                
            }
    }
    
    func LogIn(email :String, password: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void)
    {
        let URL =  "http://172.17.1.81:3000/user/"
        
        var yo = ""
        AF.request(Consts.URLuser+"login",method: .post,parameters: ["email": email,"password" : password],encoding: JSONEncoding.default)
            .validate()
         
            .responseDecodable(of: UserLoginJson.self) { (response) in
                guard let registeuser = response.value else {
               //     print("\(response)")
                    print("-------")
                    
                    print("-------")
                    onError("invalid email or password")
                    return
                }
                    print("-------")
                do{
                    print("------------")
                    print(registeuser.token)
                    print("//////////////")
                    print(registeuser)
                    UserDefaults.standard.set("\(registeuser.token)", forKey: "token")
                    UserDefaults.standard.set("\(registeuser.user.id)", forKey: "id")
                    UserDefaults.standard.set("\(registeuser.user.email)", forKey: "email")
                    UserDefaults.standard.set("\(registeuser.user.username)", forKey: "username")
                    UserDefaults.standard.set("\(registeuser.user.role)", forKey: "role")
                    //                    UserDefaults.standard.set("\(registeuser.user.optCode)", forKey: "code")
                    print("------")
                    print(UserDefaults.standard.string(forKey: "token")!)
                    //                    print(UserDefaults.standard.string(forKey: "email"))
                    //
                    //                    print(UserDefaults.standard.string(forKey: "username"))
                    //
                    //                    print(UserDefaults.standard.string(forKey: "role"))
                    //
                    //                    print(UserDefaults.standard.string(forKey: "code"))
                    print("------")
                    yo = UserDefaults.standard.string(forKey: "token")!
                    print("yo = \(yo)")
                    onSuccess()
                }
                
            }
    }
  
    
    func changepassword(password:String,newpassword:String) -> Bool
    {        let URL = "http://172.17.1.81:3000/user/"
        var useid = UserDefaults.standard.string(forKey: "id")!
        print(useid)
        var yo = false
        AF.request(URL+"ChangePasswordProfile/\(useid)",method: .post,parameters: ["password": password,"newPassword" : newpassword],encoding: JSONEncoding.default)
            .validate()
            .responseJSON{
                (result) in
                print(result)
                yo = true
            }
        return yo
    }
    func sendMail(email:String) -> Int {
        let URL = "http://172.17.1.81:3000/user/"
        var yo : Int = 0
        AF.request(URL+"reset",method: .post,parameters: ["email": email],encoding: JSONEncoding.default)
            .validate()
            .responseJSON{
                (data) in
                print(data.value)
            }
        return yo
    }
    
    func changePass(email:String, codeot: String, newpassword: String){
        let URL = "http://172.17.1.81:3000/user/"
        var yo :Int
         AF.request(URL+"changePassword",method: .post,parameters: ["email": email,"code": codeot,"newPassword": newpassword],encoding: JSONEncoding.default)
             .validate()
             .responseJSON{
                 (data) in
                 print(data.value)
             }
    }
}
