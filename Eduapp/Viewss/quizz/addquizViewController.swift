//
//  addquizViewController.swift
//  Eduapp
//
//  Created by alaa gharbi on 6/12/2022.
//

import SwiftUI
import UIKit
class addquizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = UIHostingController(rootView: AddQuiz())
      //  controller.view.translatesAutoresizingMaskIntoConstraints = false
    //    self.addChild(controller)
        self.view.addSubview(controller.view)

        
        // 1.
               let swiftUIView = AddQuiz()
               
               // 2.
               let hostingController = UIHostingController.init(rootView: swiftUIView)
               
               // 3.
               self.addChild(hostingController)
               
               // 4.
               hostingController.didMove(toParent: self)
               
               // 5.
               self.view.addSubview(hostingController.view)
               
               // 6.
               hostingController.view.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   hostingController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
                   hostingController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                   hostingController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                   hostingController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
               ])
    }

}
