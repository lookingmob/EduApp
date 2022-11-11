//
//  LoginViewController.swift
//  EduApp
//
//  Created by alaa gharbi on 11/11/2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBAction func checkBoxBtnTapped(_ sender: UIButton) {
            if checkBoxBtn.isSelected {
                checkBoxBtn.setBackgroundImage(#imageLiteral(resourceName: "ic_signup_unchecked"), for: .normal)
            } else {
                checkBoxBtn.setBackgroundImage(#imageLiteral(resourceName: "ic_signup_checked"), for:.normal)
            }
            checkBoxBtn.isSelected = !checkBoxBtn.isSelected
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
