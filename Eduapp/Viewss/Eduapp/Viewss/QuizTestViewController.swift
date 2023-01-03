//
//  QuizTestViewController.swift
//  Eduapp
//
//  Created by alaa gharbi on 2/12/2022.
//

import UIKit

class QuizTestViewController: UIViewController {

    @IBOutlet weak var progressQuiz: UIProgressView!
    @IBOutlet weak var reponse4btn: UIButton!
    @IBOutlet weak var reponse3btn: UIButton!

    @IBOutlet weak var reponse2btn: UIButton!
    @IBOutlet weak var reponse1btn: UIButton!
    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var imagequestion: UIImageView!
    @IBOutlet weak var scorelabel: UILabel!
    
    var brainQuiz = QuizzBrain()
    override func viewDidLoad() {
        super.viewDidLoad()

        progressQuiz.progress = brainQuiz.getProgress()
        imagequestion.image = brainQuiz.getImage()
        imagequestion.layer.cornerRadius = 20
        imagequestion.layer.masksToBounds = true
        questionlabel.text = brainQuiz.getTextQuestion()
        questionlabel.textColor = brainQuiz.getColor()
        
        reponse1btn.titleLabel?.text = brainQuiz.getResponse()
        reponse2btn.titleLabel?.text = brainQuiz.getResponse1()
        reponse3btn.titleLabel?.text = brainQuiz.getResponse2()
        reponse4btn.titleLabel?.text = brainQuiz.getResponse3()
        scorelabel.text = "Score: \(brainQuiz.getScore()) pts."
    }
    
    @IBAction func reponseOneTapped(_ sender: UIButton) {
        let usersAswer = sender.titleLabel?.text ?? ""
        let rightAnswer = brainQuiz.checkAnswer (userAnswer: usersAswer)
        if rightAnswer {
        } else {
            sender.backgroundColor = UIColor.green
            sender.backgroundColor = UIColor.red
            //Wrong answer
            let generator = UIImpactFeedbackGenerator (style: .heavy)
            generator.impactOccurred()
        }
        reponse1btn.isEnabled = false
        reponse2btn.isEnabled = false
        reponse3btn.isEnabled = false
        reponse4btn.isEnabled = false
        if brainQuiz.nextQuestion () {
            let alert = UIAlertController(title: "END OF QUIZ", message: "DO YOU WANT TO TRY AGAIN?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default)
            let noAction = UIAlertAction(title: "No", style: .cancel) { _ in
            exit(0)
            }
            alert.addAction (yesAction)
            alert.addAction (noAction)
            present(alert, animated: true)
        }else{
            Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector (changeQuestion), userInfo: nil,repeats: false)
        }
        
    }
    @objc func changeQuestion() {
        progressQuiz.progress = brainQuiz.getProgress()
        imagequestion.image = brainQuiz.getImage()
        imagequestion.layer.cornerRadius = 20
        imagequestion.layer.masksToBounds = true
        questionlabel.text = brainQuiz.getTextQuestion()
        reponse1btn.titleLabel?.text = brainQuiz.getResponse()
        reponse2btn.titleLabel?.text = brainQuiz.getResponse1()
        reponse3btn.titleLabel?.text = brainQuiz.getResponse2()
        reponse4btn.titleLabel?.text = brainQuiz.getResponse3()
        questionlabel.textColor = brainQuiz.getColor()
        scorelabel.text = "Score: \(brainQuiz.getScore()) pts."
        reponse1btn.backgroundColor = UIColor.white
        reponse2btn.backgroundColor = UIColor.white
        reponse3btn.backgroundColor = UIColor.white
        reponse4btn.backgroundColor = UIColor.white
        reponse1btn.isEnabled = true
        reponse2btn.isEnabled = true
        reponse3btn.isEnabled = true
        reponse4btn.isEnabled = true

    }
}
