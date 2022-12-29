//
//  BiometricViewController.swift
//  Eduapp
//
//  Created by alaa gharbi on 29/12/2022.
//

import UIKit
import LocalAuthentication

class BiometricViewController: UIViewController {
    func authenticate() {
        let context = LAContext()
        var error: NSError? = nil
        if        context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason) {
                [weak self] success, authenticationError in
                DispatchQueue.main.async {
                    guard success, error == nil else{
                        return
                    }
                    self?.performSegue(withIdentifier: "mainsegue", sender: nil)
                }
            }
        } else {
            //No biometrics available
            let alert = UIAlertController(title: NSLocalizedString("Unavailable", comment: ""), message:NSLocalizedString("FaceID Auth not available", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: ""), style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticate()
    }
    


}
