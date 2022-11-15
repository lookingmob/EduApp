import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var repeatPasswordTF: UITextField!
    @IBOutlet weak var genderselect: UISegmentedControl!
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBAction func AppleSignIn(_ sender: UIButton) {
    }
    
    @IBAction func tnsubmit(_ sender: UIButton) {
        if UserViewModel().signIn(username:firstNameTF.text!,email:emailTF.text!,password:passwordTF.text!){
            self.showToast(message: "user created", font: .systemFont(ofSize: 12.0))
        }
        else{
            print("login problem")
        }
            
          
    }
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var lastNameTF: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }

    @IBAction func googleSignInBt(_ sender: UIButton) {
    }
    func getMissingValidation(str: String) -> [String] {
        var errors: [String] = []
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: str)){
            errors.append("least one uppercase")
        }
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: str)){
            errors.append("least one digit")
        }

        if(!NSPredicate(format:"SELF MATCHES %@", ".*[!&^%$#@()/]+.*").evaluate(with: str)){
            errors.append("least one symbol")
        }
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: str)){
            errors.append("least one lowercase")
        }
        
        if(str.count < 8){
            errors.append("min 8 characters total")
        }
        return errors
    }
    
}
extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
