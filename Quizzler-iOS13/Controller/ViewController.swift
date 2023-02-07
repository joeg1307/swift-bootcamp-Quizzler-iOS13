//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let CLEAR_USER_FEEDBACK_TIME = 0.2 // in seconds
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var opt1Button: UIButton!
    @IBOutlet weak var opt2Button: UIButton!
    @IBOutlet weak var opt3Button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotRight = quizBrain.checkAnswer(answer: userAnswer)
        
        if userGotRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval:CLEAR_USER_FEEDBACK_TIME, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        let choices = quizBrain.getChoices()
        if quizBrain.getNumberOfChoices() == 2{
            opt1Button.isHidden = true
            opt2Button.setTitle( "True", for: .normal) 
            opt3Button.setTitle( "False", for: .normal)
        }else{
            opt1Button.isHidden = false
            opt1Button.setTitle(  choices[0], for: .normal)
            opt2Button.setTitle(  choices[1], for: .normal)
            opt3Button.setTitle(  choices[2], for: .normal)
        }
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        opt1Button.backgroundColor = UIColor.clear
        opt2Button.backgroundColor = UIColor.clear
        opt3Button.backgroundColor = UIColor.clear
    }
    
}

