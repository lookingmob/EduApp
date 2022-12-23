//
//  TabBarViewController.swift
//  Eduapp
//
//  Created by alaa gharbi on 29/11/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//authenticate()
        
        // Do any additional setup after loading the view.
    }
//    func authenticate() {
//        let context = LAContext()
//        var error: NSError? = nil
//        if        context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "Identify yourself!"
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
//                                   localizedReason: reason) {
//                [weak self] success, authenticationError in
//                DispatchQueue.main.async {
//                    guard success, error == nil else{
//                        //Authentication failed, prompt an error message to the
//                        //user
//                        return
//                    }
//                    //Authentication successful! Proceed to next app screen.
//                    self?.performSegue(withIdentifier: "loginsegue", sender: nil)
//                }
//            }
//        } else {
//            //No biometrics available
//            let alert = UIAlertController(title: "Unavailable", message: "FaceID Auth not available", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//            present(alert, animated: true)
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
