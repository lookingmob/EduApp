//
//  WelcomeViewController.swift
//  EduApp
//
//  Created by alaa gharbi on 11/11/2022.
//

import UIKit
import Alamofire

class WelcomeViewController: UIViewController {
    @IBAction func Login(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        AF.request(URL,method: .post,parameters: ["username": "tchala","email": "tirairiai@gmail.com","password" : "123456"],encoding: JSONEncoding.default)
//          .validate()
//          .responseJSON{ (data) in
//              print(data)
//          }
        let URL = "http://172.17.0.155:3000/user/"
//
//        AF.request(URL+"login",method: .post,parameters: ["email": "tirairiai@gmail.com","password" : "123456"],encoding: JSONEncoding.default)
//          .validate()
//          .responseJSON{ (data) in
//              print(data)
//          }
        
//        AF.request(URL+"6372e756c022d98b7c9dd38f",method: .patch,parameters: ["email": "tirairai@gmail.com","password" : "123456"],encoding: JSONEncoding.default)
//          .validate()
//          .responseJSON{ (data) in
//              print(data)
//          }
        
       if( UserViewModel().profile())
        {print("profile succes")}
        
    }
    

//     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzcyZTc1NmMwMjJkOThiN2M5ZGQzOGYiLCJpYXQiOjE2Njg0NzU3OTV9.8T-CXof233kKn6jRzvhdZ3PayRRJlStoWEJcBeRJnsc"
}
