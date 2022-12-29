//
//  ResetPasswordViewController.swift
//  EduApp
//
//  Created by alaa gharbi on 21/11/2022.
//

import UIKit
import Alamofire

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var codeTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBAction func resetPwd(_ sender: UIButton) {
      
        AF.request("http://172.17.2.159:3000/user/changePassword",method: .post,parameters: ["email": UserDefaults.standard.string(forKey: "verifyemail")!,"code" : codeTF.text!,
"password": passwordTF.text!,
            "newPassword": passwordTF.text!
             ]
             ,encoding: JSONEncoding.default)
               .validate()
                  .responseJSON{ (data) in
                      print(data)
                      print("---")
                  }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
/*
 http//2345.126345.12.12:124/user/changePassword
 {
 "email": "islem.naffal-gmail.co"
 "password" : "1234567"
 "newPassword" : "1234567"
 }
 
 */


//success({
//    user =     {
//        "__v" = 0;
//        "_id" = 638581f10a4f23431f5396b7;
//        createdAt = "2022-11-29T03:52:17.652Z";
//        email = "ala.gharbi@esprit.tn";
//        otpCode = 6745;
//        password = "$2b$10$.qIql12rboVC.8ryR0WYP.iSZzFD/rPMYh7N/uc58fbFGITALsqfG";
//        role = user;
//        updatedAt = "2022-11-29T04:11:00.647Z";
//        username = tigana;
//    };
//})
//---
