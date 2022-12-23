//
//  AnimatedViewController.swift
//  EduApp
//
//  Created by alaa gharbi on 21/11/2022.
//

import UIKit
import Lottie

class AnimatedViewController: UIViewController {

    private var animationView: LottieAnimationView?

        override func viewDidLoad() {

          super.viewDidLoad()
          
          // 2. Start AnimationView with animation name (without extension)
          
          animationView = .init(name: "coffee")
          
          animationView!.frame = view.bounds
          
          // 3. Set animation content mode
          
          animationView!.contentMode = .scaleAspectFit
          
          // 4. Set animation loop mode
          
          animationView!.loopMode = .loop
          
          // 5. Adjust animation speed
          
          animationView!.animationSpeed = 0.5
          
          view.addSubview(animationView!)
          
          // 6. Play animation
          
          animationView!.play()
          
        }
}
