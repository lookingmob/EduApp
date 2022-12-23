import UIKit
import Alamofire
import AlamofireImage

class ProfileViewController: UIViewController {

    @IBAction func loggout(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "Welcome")
        UserDefaults.clear()
        // This is to get the SceneDelegate object from your view controller
        // then call the change root view controller function to change to main tab bar
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    @IBOutlet weak var rolelabel: UILabel!
    @IBOutlet weak var emaillb: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//       if( UserViewModel().profile())
//        {
        
//        (UserDefaults.standard.string(forKey: "image")? != ""){
        let url = URL(string: UserDefaults.standard.string(forKey: "picture") ?? "hihi.jpg")
            print(url)
            profileImg.af.setImage(withURL: url!)
//        }
          self.username.text = UserDefaults.standard.string(forKey: "username")
           self.emaillb.text = UserDefaults.standard.string(forKey: "email")
//     //      self.rolelabel.text = "student
//           print("true")
//       }
        
    }
}
extension UserDefaults {
    static func clear() {
        guard let domain = Bundle.main.bundleIdentifier else { return }
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
