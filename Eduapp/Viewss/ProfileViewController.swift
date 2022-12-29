import UIKit
import SideMenu
import LocalAuthentication
import Alamofire
import AlamofireImage

class ProfileViewController: UIViewController {
    private let sideMenu = SideMenuNavigationController (rootViewController: MenuController(with: ["Home","Profile",""]) )
    
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

        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView:view)
        
    }
    
    @IBAction func didTapMenuButton() {
        present (sideMenu, animated: true)
    }
    
}
extension UserDefaults {
    static func clear() {
        guard let domain = Bundle.main.bundleIdentifier else { return }
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}

class MenuController: UITableViewController {
    private let menuItems: [String]
    init(with menuItems: [String]) {
        self.menuItems = menuItems
        super.init (nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")}
    required init?(coder: NSCoder){
        fatalError ("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = menuItems [indexPath.row]
    return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            tableView.deselectRow(at: indexPath, animated: true)
            // Relay to delegate about menu item selection
        }
        
    }
