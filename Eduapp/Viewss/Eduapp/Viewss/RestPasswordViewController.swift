//
//  RestPasswordViewController.swift
//  EduApp
//
//  Created by alaa gharbi on 22/11/2022.
//

import UIKit

class RestPasswordViewController: UIViewController {
    @IBOutlet weak var emailvarr: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func seeenEmail(_ sender: Any) {
    }
    
}

/*
 http//2345.126345.12.12:124/user/changePassword
 {
 "email": "islem.naffal-gmail.co"
 "code" : "2423"
 "password" : "1234567"
 "newPassword" : "1234567"
 }
 
 */
