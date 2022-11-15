import Foundation
class UserViewModel{
    let URL = "http://172.17.0.155:3000/user/"
    func signIn(username:String,email:String,password:String) -> Bool {
      if UserService().SignIn(urlStr: URL, userusername: username, useremail: email, userpassword: password) == "User Added Successfully!"
        { return true}
        return false
    }
    func login(email:String,password:String) -> Bool
    {if UserService().LogIn(urlStr: URL, useremail: email, userpassword: password) != ""
        { return true}
        return false
    }
    func profile() -> Bool
    {if UserService().getProfile() == ""
        { return true}
        return false
    }
}
