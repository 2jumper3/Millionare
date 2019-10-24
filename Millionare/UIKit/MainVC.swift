//
//  MainVC.swift
//  Millionare
//
//  Created by Sergey on 23.10.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    var questionsView: Answers!
    var questions2View: Answers!
    var questions3View: Answers!
    var questions4View: Answers!
    var questionView: QuestionsUIKit!
    
    var textLabel1 = UIButton()
    var textLabel2 = UIButton()
    var textLabel3 = UIButton()
    var textLabel4 = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        addAnswers()
        addQuestions()
    }
    override func viewWillAppear(_ animated: Bool) {
                addText(text: number1)

    }
    
    //MARK: - создание VIEW вопрос/ответ
    private func addAnswers() {
        
        let answer1 = Answers(x: 0, y: UIScreen.main.bounds.size.height / 2, color: .white)
        self.questionsView = answer1
        let answer2 = Answers(x: questionsView.bounds.width , y: UIScreen.main.bounds.size.height / 2, color: .red)
        self.questions2View = answer2
        let answer3 = Answers(x: 0, y: UIScreen.main.bounds.size.height / 2 + questionsView.bounds.height, color: .green)
        self.questions3View = answer3
        let answer4 = Answers(x: questionsView.bounds.width, y: UIScreen.main.bounds.size.height / 2 + questionsView.bounds.height, color: .gray)
        self.questions4View = answer4
        self.view.addSubview(answer1)
        self.view.addSubview(answer2)
        self.view.addSubview(answer3)
        self.view.addSubview(answer4)


    }
    
    private func addQuestions() {
        let question1 = QuestionsUIKit(x: 0, y: UIScreen.main.bounds.size.height / 4 - 50, color: .cyan)
        self.questionView = question1
        self.view.addSubview(question1)
    }
    //MARK: - добавление текста вопросов
     func addText (text: question1) {
        let questionTextLabel = UILabel()
//        let textLabel1 = UIButton()
//        let textLabel2 = UIButton()
//        let textLabel3 = UIButton()
//        let textLabel4 = UIButton()

        questionTextLabel.frame = self.questionView.bounds
        questionTextLabel.text  = text.question
        questionTextLabel.textAlignment = .center
        
        self.textLabel1.frame = self.questionsView.bounds
        self.textLabel1.setTitle(text.answer1, for: .normal)
        self.textLabel1.setTitleColor(.black, for: .normal)
        self.textLabel1.addTarget(self, action: #selector(buttonAction1), for: .touchUpInside)
        
        self.textLabel2.frame = self.questions2View.bounds
        self.textLabel2.setTitle(text.answer2, for: .normal)
        self.textLabel2.setTitleColor(.black, for: .normal)
        self.textLabel2.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        
        self.textLabel3.frame = self.questions3View.bounds
        self.textLabel3.setTitle(text.answer3, for: .normal)
        self.textLabel3.setTitleColor(.black, for: .normal)
        self.textLabel3.addTarget(self, action: #selector(buttonAction3), for: .touchUpInside)

        self.textLabel4.frame = self.questions4View.bounds
        self.textLabel4.setTitle(text.answer4, for: .normal)
        self.textLabel4.setTitleColor(.black, for: .normal)
        self.textLabel4.addTarget(self, action: #selector(buttonAction4), for: .touchUpInside)

        self.questionsView.addSubview(textLabel1)
        self.questions2View.addSubview(textLabel2)
        self.questions3View.addSubview(textLabel3)
        self.questions4View.addSubview(textLabel4)
        self.questionView.addSubview(questionTextLabel)
    }
// MARK: - список вопросов
    var number1 = question1(question: "2+2", answer1: "4", answer2: "5", answer3: "6", answer4: "7")
     var number2 = question1(question: "3+3", answer1: "8", answer2: "9", answer3: "10", answer4: "11")
     var number3 = question1(question: "4+4", answer1: "12", answer2: "13", answer3: "14", answer4: "15")
     var number4 = question1(question: "5+5", answer1: "16", answer2: "17", answer3: "18", answer4: "19")
     var number5 = question1(question: "6+6", answer1: "20", answer2: "21", answer3: "22", answer4: "23")
    var currectAnswers = ["4", "6", "8", "10", "12"]
     
    
    
    // MARK:- нажатие
    @objc private  func buttonAction1() {
        currectAnswer(text: self.textLabel1.titleLabel?.text ?? "error")
    }
    @objc private  func buttonAction2() {
        currectAnswer(text: self.textLabel2.titleLabel?.text ?? "error")
    }
    @objc private  func buttonAction3() {
        currectAnswer(text: self.textLabel3.titleLabel?.text ?? "error")
    }
    @objc private  func buttonAction4() {
        currectAnswer(text: self.textLabel4.titleLabel?.text ?? "error")
    }
    func currectAnswer (text: String) {
        for i in 0..<currectAnswers.count {
            if text == currectAnswers[i] {
                print ("currect")
                UIView.animate(withDuration: 2, animations: {
                    
                    self.questionsView.removeFromSuperview()
                    self.questions2View.removeFromSuperview()
                    self.questions3View.removeFromSuperview()
                    self.questions4View.removeFromSuperview()
                    self.questionView.removeFromSuperview()
                    self.addAnswers()
                    self.addQuestions()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {

                        self.addText(text: self.number2)
                    })
                    
                }, completion: { (finished: Bool) in
                })

//                self.questionView.setNeedsDisplay()
            } else  {
            let alertController = UIAlertController(title: "You Are Wrong", message: "Wrong Answer", preferredStyle: .alert)
            let alertOk = UIAlertAction(title: "Done", style: .cancel) { (action: UIAlertAction) in }
            alertController.addAction(alertOk)
            self.present(alertController, animated: true, completion: nil)
            }
            let alertController = UIAlertController(title: "Congrats!", message: "Правильный ответ!", preferredStyle: .alert)
            let alertOk = UIAlertAction(title: "Done", style: .cancel) { (action: UIAlertAction) in }
            alertController.addAction(alertOk)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
