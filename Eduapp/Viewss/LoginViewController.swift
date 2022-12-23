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
                            //Authentication failed, prompt an error message to the
                            //user
                            return
                        }
                        //Authentication successful! Proceed to next app screen.
                        self?.performSegue(withIdentifier: "loginsegue", sender: nil)
                    }
                }
            } else {
                //No biometrics available
                let alert = UIAlertController(title: "Unavailable", message: "FaceID Auth not available", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                present(alert, animated: true)
            }
        }
        
//
    
    
    @IBOutlet weak var views: UIView!
    
    
    @IBOutlet weak var btFacebook: FBLoginButton!
//    let signInConfig = GIDConfiguration(clientID: "694053905588-i502s9hvn2ntmcbqb0k2q5ccv8k8kcp3.apps.googleusercontent.com")
    @IBOutlet weak var emailtf: UITextField!
    @IBAction func resetBtn(_ sender: UIButton) {
        //  present(EmailResetPasswordViewController(), animated: true)
//        AF.request("http://172.17.2.159:3000/quiz/",method: .get)
//          .validate()
//             .responseJSON{ apiResponse in
//                 switch apiResponse.result{
//                 case .success(_):
//                     let apiDictionary = apiResponse.value as? [String:Any]
//                     print("apiResponse --- \(apiDictionary)")
//                     self.performSegue(withIdentifier: "resetpsd", sender: nil)
//                 case .failure(_):
//                     print("got an error")
//                 }
//
//             }
        performSegue(withIdentifier: "resetpsd", sender: nil)
    }
    //GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
    // guard error == nil else { return }
    @IBAction func goolgleBtn(_ sender: UIButton) {
        
//        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
//            guard error == nil else { return }
//            guard let user = user else { return }
//
//            let emailAddress = user.profile?.email
//            let usernamg = user.profile?.name
//            let usrfamilyname = user.profile?.familyName
//            let img = user.profile?.imageURL(withDimension: 50)
//         //   UserDefaults.standard.set("\(userID!)", forKey: "id")
//            UserDefaults.standard.set("\(emailAddress!)", forKey: "email")
//            UserDefaults.standard.set("\(usernamg!)", forKey: "username")
//            UserDefaults.standard.set("\(img)", forKey: "picture")
//
//            print("*****--------*")
//          //  print("\(img)")
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let mainTabBarController = storyboard.instantiateViewController(identifier: "mainTabBar")
//
//            // This is to get the SceneDelegate object from your view controller
//            // then call the change root view controller function to change to main tab bar
//
//              (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
//        }
        
        let context = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate to access the app", reply: {(success, error) in
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
//            let token = token.tokenString
//            let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
//                                                     parameters: ["fields" : "email , name"],
//                                                     tokenString: token,
//                                                     version: nil,
//                                                     httpMethod: .get)
//            request.start(completionHandler: {connection,
//                result,
//                error in print("\(result)")
//            })                // User is logged in, do work such as go to next view controller.
        }else{
        
            btFacebook.permissions = ["public_profile", "email"]
            btFacebook.delegate = self
               //     view.addSubview(btFacebook)

        }
        
        
        
        
//                if (AccessToken.current != nil) {
//        //                // User is logged in, do work such as go to next view controller.
//                    performSegue(withIdentifier: "home", sender: nil)
//                    }
//
        // Extend the code sample from 6a. Add Facebook Login to Your Code
        // Add to your viewDidLoad method:
   
        
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
            self.alertWithTitle(title: "invalid information", message: errorMessage, ViewController: self, toFocus:self.emailtf)
    }
    }

    func onErrorFunction() {
        print("error !!!!")
    }
    func navToView(){
        print("user Success")
 
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "mainTabBar")
        
        // This is to get the SceneDelegate object from your view controller
        // then call the change root view controller function to change to main tab bar
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        
    }
    func logInTo(uemail: String, upassword: String,onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        //affichage du progressBar
        
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
            //            self.profileImage.image = UIImage(named: "profile")
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
