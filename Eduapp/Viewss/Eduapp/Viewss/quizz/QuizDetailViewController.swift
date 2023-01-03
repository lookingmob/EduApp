//
//  QuizDetailViewController.swift
//  Eduapp
//
//  Created by alaa gharbi on 5/12/2022.
//

import UIKit
import Alamofire

class QuizDetailViewController: UIViewController {

    @IBOutlet weak var correctanswer: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var questionlb: UILabel!
    var id: String = ""
    var ques: String = ""
    var cansw: String = ""
    var wrongan1: String = ""
    var wrongan2: String = ""
    var wrongan3: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.id = QuizConsts.id
        self.correctanswer.text = QuizConsts.correctanswer
   //     self.answer1.text = QuizConsts.anwser1
        self.answer2.text = QuizConsts.answer2
        self.answer3.text = QuizConsts.answer3

        print("pront"+id)
       // questionlb.text = QuizConsts.question
    }
       @IBAction func deletequizsubmit(_ sender: Any) {
       AF.request("http://172.17.1.81:3000/quiz/\(id)",method: .delete)
            .validate()
            .responseJSON { apiResponse in
                
                switch apiResponse.result{
                case .success(_):
                    let apiDictionary = apiResponse.value as? [String:Any]
                    print("apiResponse --- \(apiDictionary)")
                    self.alertWithTitle(title: "delete succeed", message: "quiz successfully deleted")

                case .failure(_):
                    print("got an error")
                }
            }
       
    }
    func alertWithTitle(title: String!, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel,handler: {_ in
          //  toFocus.becomeFirstResponder()
        });
        alert.addAction(action)
        present(alert, animated: true, completion:nil)
    }
}
