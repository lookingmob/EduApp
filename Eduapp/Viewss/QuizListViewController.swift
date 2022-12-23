//
//  QuizListViewController.swift
//  Eduapp
//
//  Created by alaa gharbi on 30/11/2022.
//

import UIKit
import Alamofire

class QuizListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var obs = [String : Dictionary<String,String>] ()
        var dys = [String : String] ()
        AF.request("https://the-trivia-api.com/api/questions",method: .get)
            .validate()
            .responseDecodable(of: [Quiz].self) { (response) in
                switch response.result
                {
                case .success(let res):
                    print(res)
                    print("------")
                case .failure(let err):
                    print(err.errorDescription)
                }
            }
        
        
        
    }
    
}
