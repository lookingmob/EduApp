//
//  EmailResetPasswordViewController.swift
//  EduApp
//
//  Created by alaa gharbi on 21/11/2022.
//

import UIKit
import Alamofire

class EmailResetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTf: UITextField!
  
    @IBOutlet weak var sendmail: UIButton!
    
    @IBAction func emailSubmit(_ sender: UIButton) {
        if(emailTf.text! != ""){
            //        if (UserViewModel().mailer(usermail: emailTf.text!)){
            //            performSegue(withIdentifier: "newpasswordreset", sender: nil)
            //
            //          //  self.present(settingController, animated: true, completion: nil)
            //        }else{
            //            //self.present(settingController, animated: true, completion: nil)
            //            performSegue(withIdentifier: "newpasswordreset", sender: nil)
            //
            //        }
            
            
            
            //172.17.6.104/user/reset
            
            //  methode post
            //{"email " : "hamza.bouzidi@esprit.tn"}
            
            AF.request("http://172.17.2.159:3000/user/reset",method: .post,parameters: [
                "email": emailTf.text!
            ]
                       ,encoding: JSONEncoding.default)
            .validate()
            .responseJSON{ (data) in
                print(data)
                UserDefaults.standard.set(self.emailTf.text! , forKey: "verifyemail")
                print("---")
                self.performSegue(withIdentifier: "newpasswordreset", sender: nil)
            }
            //        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
//newpasswordreset

//success({
//newCode = 1956;
//})
