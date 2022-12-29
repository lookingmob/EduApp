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

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeimageview: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        // Step 1: Ask for permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        // Step 2: Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Hey I'm a notification!"
        content.body = "Look at me!"
        
        // Step 3: Create the notification trigger
        let date = Date().addingTimeInterval(10)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Step 4: Create the request
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Step 5: Register the request
        center.add(request) { (error) in
            // Check the error parameter and handle any errors
        }
 
        
    }
    

}






