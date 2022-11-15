import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailtf: UITextField!
    
    @IBOutlet weak var passwordtf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
    }
    
    @IBAction func btsubmit(_ sender: UIButton) {if(emailtf.text! != "" && passwordtf.text! != ""){
        if (UserViewModel().login(email: emailtf.text!, password: passwordtf.text!)){
            present(ProfileViewController(), animated: false)
        }
    }
    }
}
