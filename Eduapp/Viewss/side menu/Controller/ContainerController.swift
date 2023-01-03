//
//  ContainerController.swift
//  Eduapp
//
//  Created by alaa gharbi on 2/1/2023.
//

import UIKit

class ContainerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureHome()
    }
    
func configureHome()
    {
        let home = ViewController()
        let container = UINavigationController(rootViewController: home)
        self.view.addSubview(container.view)
        addChild(container)
        container.didMove(toParent: self)
    }

}
