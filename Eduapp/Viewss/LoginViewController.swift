import UIKit
import FBSDKLoginKit
import Alamofire
import LocalAuthentication
//import FacebookLogin

//import GoogleSignIn
class LoginViewController: UIViewController {
    
    
    @IBAction func taploginbar(_ sender: Any) {
      
            authenticate()
        }
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
                        self?.performSegue(withIdentifier: "loginsegue", sender: nil)
                    }
                }
            } else {
                //No biometrics available
                let alert = UIAlertController(title: NSLocalizedString("Unavailable", comment: ""), message:NSLocalizedString("FaceID Auth not available", comment: ""), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: ""), style: .cancel, handler: nil))
                present(alert, animated: true)
            }
        }
        
//
    
    
    @IBOutlet weak var views: UIView!
    
    
    @IBOutlet weak var btFacebook: FBLoginButton!
//    let signInConfig = GIDConfiguration(clientID: "694053905588-i502s9hvn2ntmcbqb0k2q5ccv8k8kcp3.apps.googleusercontent.com")
    @IBOutlet weak var emailtf: UITextField!
    @IBAction func resetBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "resetpsd", sender: nil)
    }
    @IBAction func goolgleBtn(_ sender: UIButton) {
        
        let context = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: NSLocalizedString("Authenticate to access the app", comment: ""), reply: {(success, error) in
            if success
                {
                print("correct")
            }
                else {
                    print("incorrect")
            }
            })
            
        }
        else
        {
            print("not able to access authenticate")
        }
        }
        
    
    @IBOutlet weak var passwordtf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
      
        if let token = AccessToken.current,
           !token.isExpired {
        }else{
        
            btFacebook.permissions = ["public_profile", "email"]
            btFacebook.delegate = self
   
        }
   
        
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
    
    @IBAction func btsubmit(_ sender: UIButton)  {
        //"ag.gharbi7@gmail.com"
        //"12345678"
        self.logInTo(uemail: emailtf.text!, upassword: passwordtf.text!
                     , onSuccess: {self.navToView()}){
        (errorMessage) in
        print("pronto amigo hahaahah")
            self.alertWithTitle(title: NSLocalizedString("invalid information", comment: ""), message: errorMessage, ViewController: self, toFocus:self.emailtf)
    }
    }

    func onErrorFunction() {
        print("error !!!!")
    }
    func navToView(){
        print("user Success")
 
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "mainTabBar")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        
    }
    func logInTo(uemail: String, upassword: String,onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        UserService().LogIn(email: uemail, password : upassword, onSuccess: {
            onSuccess()
        })
        {
            (errorMessage) in
            onError(errorMessage)
        }
    }
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

    func alertWithTitle(title: String!, message: String, ViewController: UIViewController, toFocus:UITextField) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel,handler: {_ in
            toFocus.becomeFirstResponder()
        });
        alert.addAction(action)
        present(alert, animated: true, completion:nil)
    }

}
extension LoginViewController : LoginButtonDelegate{
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields" : "id, email, name, first_name, last_name, picture, short_name, age_range"], tokenString: token, version: nil, httpMethod: .get)
        request.start{
            (connection, result, error) in
//            print("------")
//            print("\(result)")
//            print("------")
            if error != nil {
                        print("Failed to start graph request:", error ?? "")
                        return
                    }

                    let dict: NSDictionary = result as! NSDictionary
                    print("The result dict of fb profile::: \(dict)")
            let email = dict["email"] as? String
            let name = dict["name"] as? String
                     print("The result dict[email] of fb profile::: \(email!)")
                    let userID = dict["id"] as? String
                    print("The result dict[id] of fb profile::: \(userID!)")
       
            let facebookProfileUrl = "https://graph.facebook.com/\(userID!)/picture?type=large"
            //UserDefaults.standard.set("\(registeuser.token)", forKey: "token")
            UserDefaults.standard.set("\(userID!)", forKey: "id")
            UserDefaults.standard.set("\(email!)", forKey: "email")
            UserDefaults.standard.set("\(name!)", forKey: "username")
            UserDefaults.standard.set("\(facebookProfileUrl)", forKey: "picture")
            print(UserDefaults.standard.string(forKey: "username")!)
            self.navToView()
        }
    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("logged out !!!")
    }
}
