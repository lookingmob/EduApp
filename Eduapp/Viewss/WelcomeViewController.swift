//
//  WelcomeViewController.swift
//  EduApp
//
//  Created by alaa gharbi on 11/11/2022.
//

import UIKit
import Alamofire
import AlamofireImage
import Lottie
import UserNotifications
class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeimageview: UIImageView!
   func send(){
        //Mark: -Ask The User  Permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge])
        {
            (_,_)in
        }
           //step2 create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Hello"
        content.body = "This My First Notification"
        //step3
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let req = UNNotificationRequest(identifier: "req", content: content, trigger: trigger)
        //step register with notification center
        UNUserNotificationCenter.current().add(req , withCompletionHandler: nil)
    }
    
 func compareStrings(){
     var count = 0
        let string = "chiaii::acioajci - dfdfs *ds f::ddf / *- _::_:-"
     let secondstring = "chicaii::acioajci - df::dfs *ds f::ddf / *- _::_:-"

        let components = string.components(separatedBy: "::")
        let secondcomponents = secondstring.components(separatedBy: "::")
        print(components)
        print(secondcomponents)

     for i in 0..<min(components.count, secondcomponents.count) {
         if components[i] != secondcomponents[i] {
             count += 1
         }
     }

     if components.count > secondcomponents.count {
         count += components.count - secondcomponents.count
     } else if secondcomponents.count > components.count {
         count += secondcomponents.count - components.count
     }

     print("Number of different elements: \(count)")
     
     
     // prints "Number of different elements: 1"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
           let center = UNUserNotificationCenter.current()
        self.send()
        print("    ")
        self.compareStrings()
            }
           }







