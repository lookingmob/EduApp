import UIKit
import Alamofire

class SignInViewController: UIViewController ,UITextFieldDelegate {
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var repeatPasswordTF: UITextField!
    @IBOutlet weak var genderselect: UISegmentedControl!
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBAction func AppleSignIn(_ sender: UIButton) {
    }
    
    @IBAction func tnsubmit(_ sender: UIButton) {
        
        if(!checkForErrors()){
            print("nici")
//            self.RegisterTo(username:firstNameTF.text!+"_"+lastNameTF.text!,uemail:emailTF.text!,upassword:passwordTF.text!, onSuccess: {self.navToView()})
//            {
//                (errorMessage) in
//                print("pronto amigo hahaahah")
//                self.alertWithTitle(title: "invalid information", message: errorMessage, ViewController: self, toFocus:self.firstNameTF)
//
//            }
//            AF.request("http://172.17.2.159:3000/user/register",method: .post,parameters: ["username": "userusername","email": "ag.gharbiz7@gmail.com","password" : "123456789"],encoding: JSONEncoding.default)
//                .validate()
//                .responseDecodable(of: RegisterResponseUser.self) { (response) in
//                    guard let registeuser = response.value else {
//                        return
//                    }
//                    do{
//
//                        print(registeuser.message)
//                        print(registeuser.doc.email)
//                        print(registeuser.doc.id)
//                        print("//////////////")
//                        print(registeuser)
//                    }
//
//                }
            AF.request("http://172.17.9.16:3000/user/register",method: .post,parameters: ["username": firstNameTF.text!,
                                                                                           "email": emailTF.text!,
                                                                                           "password": passwordTF.text!
                 ]
                 ,encoding: JSONEncoding.default)
                   .validate()
//                  .responseJSON{ (data) in
//                      print(data)
//                      print("---")
//                  }
                  .responseDecodable(of: RegisterResponseUser.self) { (response) in
                                      guard let registeuser = response.value else {
                                          return
                                      }
                                      do{
                  
                                          print(registeuser.message)
                                          print(registeuser.doc.email)
                                          print(registeuser.doc.id)
                                          print("//////////////")
                                          print(registeuser)
                                          let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                          let mainTabBarController = storyboard.instantiateViewController(identifier: "Welcome")
                                          // This is to get the SceneDelegate object from your view controller
                                          // then call the change root view controller function to change to main tab bar
                                          (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                                      }
                  
                                  }
        }
    }



    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var lastNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        repeatPasswordTF.delegate = self
        emailTF.delegate = self
        passwordTF.delegate = self

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
    func onErrorFunction() {
        print("error !!!!")
    }
    func navToView(){
        print("user Success")
        let vc = self.storyboard?.instantiateViewController(identifier: "login") as! LoginViewController
           self.view.window?.rootViewController = vc
        //present(SlitViewController(), animated: true)
    }
        func RegisterTo(username: String ,uemail: String, upassword: String,onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        //affichage du progressBar
            let URL = "http://172.17.2.159:3000/user/"
        UserService().SignIn(userusername: username, useremail: uemail, userpassword: upassword, onSuccess: {
            onSuccess()
        })
        {
            (errorMessage) in
            onError(errorMessage)
        }
    }
}
extension SignInViewController{
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
}





    func isValidEmail (test:String) ->Bool{
               NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: test)
    }
    func isValidname (test:String) ->Bool{
               NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]").evaluate(with: test)
    }

    func checkForErrors() -> Bool
    {
        var errors = false
        let title = "Error"
        var message = ""
        if firstNameTF.text!.isEmpty {
            errors = true
            
          //  message += "First name empty"
            message += NSLocalizedString("First name empty", comment: "")
            alertWithTitle(title: title, message: message, ViewController: self, toFocus:self.firstNameTF)

        }
        else if lastNameTF.text!.isEmpty
        {
            errors = true
            message += NSLocalizedString("Surname empty", comment: "")
            alertWithTitle(title: title, message: message, ViewController: self, toFocus:self.lastNameTF)

            self.lastNameTF.becomeFirstResponder()
        }
        else if emailTF.text!.isEmpty
        {
            errors = true
            message += NSLocalizedString("Email empty", comment: "")
            alertWithTitle(title: title, message: message, ViewController: self, toFocus:self.emailTF)

        }
        else if !isValidEmail(test: emailTF.text!)
        {
            errors = true
            message += NSLocalizedString("Invalid Email Address", comment: "")
            alertWithTitle(title: title, message: message, ViewController: self, toFocus:self.emailTF)

        }
        else if passwordTF.text!.isEmpty
        {
            errors = true
            message += NSLocalizedString("Password empty", comment: "")
            alertWithTitle(title: title, message: message, ViewController: self, toFocus:passwordTF)
        }
        else if (passwordTF.text!.utf16.count < 8 )
        {
            errors = true
            message += NSLocalizedString("Password must be at least 8 characters", comment: "")
            alertWithTitle(title: title, message: message, ViewController: self, toFocus:self.passwordTF)
        }

        return errors
    }

    func alertWithTitle(title: String!, message: String, ViewController: UIViewController, toFocus:UITextField) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel,handler: {_ in
            toFocus.becomeFirstResponder()
        });
        alert.addAction(action)
        present(alert, animated: true, completion:nil)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        ///For mobile numer validation
        if textField == lastNameTF {
            let allowedCharacters = CharacterSet(charactersIn:"azertyuiopmlkjhgfdsqwxcvbnAZERTYUIOPMLKJHGFDSQWXCVBN ")
         ///Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == lastNameTF{
        let maxLength = 1
           let currentString = (textField.text ?? "") as NSString
           let newString = currentString.replacingCharacters(in: range, with: string)

            return newString.count <= maxLength
            
        }
        if textField == firstNameTF {
            let allowedCharacters = CharacterSet(charactersIn:"azertyuiopmlkjhgfdsqwxcvbnAZERTYUIOPMLKJHGFDSQWXCVBN ")
         ///Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == firstNameTF{
        let maxLength = 1
           let currentString = (textField.text ?? "") as NSString
           let newString = currentString.replacingCharacters(in: range, with: string)

            return newString.count <= maxLength
            
        }
        return true
    }
}
