
import UIKit

class EditPasswordView: UIViewController {
    @IBAction func submitBtn(_ sender: UIButton) {
        if(newpasswordTF.text! != "" && oldpasswordTf.text! != ""){
            if(UserService().changepassword(password: oldpasswordTf.text!, newpassword: newpasswordTF.text!)){
              //  present(HomeViewController(), animated: true)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "mainTabBar")
                
                // This is to get the SceneDelegate object from your view controller
                // then call the change root view controller function to change to main tab bar
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "mainTabBar")
            
            // This is to get the SceneDelegate object from your view controller
            // then call the change root view controller function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
    }
    
    @IBOutlet weak var newpasswordTF: UITextField!
    @IBOutlet weak var oldpasswordTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
