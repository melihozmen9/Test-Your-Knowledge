//
//  ViewController.swift
//  Test Your Knowledge
//
//  Created by Kullanici on 9.12.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
  
    @IBOutlet weak var progressLabel: UIProgressView!
    
    @IBOutlet weak var answer1Label: UIButton!
    @IBOutlet weak var answer2Label: UIButton!
    @IBOutlet weak var answer3Label: UIButton!
    
    var myQuestionModel = QuestionsModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    @IBAction func answerPressed(_ sender: UIButton) {
        let userChoice = sender.currentTitle! // temiz bi görünüm için bir değişkene tanımladık.
        let userGotItRight = myQuestionModel.checkAnswer(userChoice: userChoice)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: false, repeats: false)
        
        
        
        myQuestionModel.nextQuestion()
    }
    
    @objc func updateUI(){
        questionLabel.text = myQuestionModel.getQuestion()
        progressLabel.progress = myQuestionModel.getProgress()
        scoreLabel.text = "Score: \(myQuestionModel.score)"
        var questionNumber : Int = myQuestionModel.questionNumber
        answer1Label.setTitle(myQuestionModel.questionArray[questionNumber].answers[0], for: .normal)
        answer2Label.setTitle(myQuestionModel.questionArray[questionNumber].answers[1], for: .normal)
        answer3Label.setTitle(myQuestionModel.questionArray[questionNumber].answers[2], for: .normal)
        answer1Label.backgroundColor = UIColor.purple
        answer2Label.backgroundColor = UIColor.purple
        answer3Label.backgroundColor = UIColor.purple
        
        
        
    }

}

