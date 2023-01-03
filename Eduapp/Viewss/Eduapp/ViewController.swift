//
//  ViewController.swift
//  Eduapp
//
//  Created by alaa gharbi on 23/11/2022.
//

import UIKit

class ViewController: UIViewController {
   // @IBOutlet weak var welcomeimageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigation()
        print("145125126121212126yala")
    }
    //Mark: -configure navigation item
    func configureNavigation() {
        self.navigationController?.navigationItem.title = "Main controller"
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(systemName:"list.bullet.circle")! .withRenderingMode(.alwaysOriginal) ,style: .plain, target: self , action: #selector(handleMenu))
    }
        //Mark: - Menu Handler
       @objc func handleMenu(){
            print("click On menu")
        }
}

