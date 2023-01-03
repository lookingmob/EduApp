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
      
        AF.request("http://172.17.1.81:3000/user/changePassword",method: .post,parameters: ["email": UserDefaults.standard.string(forKey: "verifyemail")!,"code" : codeTF.text!,
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
