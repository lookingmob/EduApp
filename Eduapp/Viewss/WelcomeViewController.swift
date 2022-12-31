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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
           let center = UNUserNotificationCenter.current()
        self.send()
            }
           }







