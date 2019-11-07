//
//  MainVC.swift
//  Millionare
//
//  Created by Sergey on 23.10.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    var counter = Int()
    var questionsView: Answers!
    var questions2View: Answers!
    var questions3View: Answers!
    var questions4View: Answers!
    var questionView: QuestionsUIKit!
    var difficulty: Difficulty!
    

    
    var textBtn1 = UIButton()
    var textBtn2 = UIButton()
    var textBtn3 = UIButton()
    var textBtn4 = UIButton()

    var testQuestions: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        addAnswers()
        addQuestions()
        let gameDelegate: Game?
        self.counter = 0
        
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
    //MARK: - добавление текста вопросов/ответов
     func addText (text: question1) {
        let questionTextLabel = UILabel()
//        if difficulty {
//            
//        }
        number2 = hard1
        
        questionTextLabel.frame = self.questionView.bounds
        questionTextLabel.text  = text.question
        questionTextLabel.textAlignment = .center
        
        self.textBtn1.frame = self.questionsView.bounds
        self.textBtn1.setTitle(text.answer1, for: .normal)
        self.textBtn1.setTitleColor(.black, for: .normal)
        self.textBtn1.addTarget(self, action: #selector(buttonAction1), for: .touchUpInside)
        
        self.textBtn2.frame = self.questions2View.bounds
        self.textBtn2.setTitle(text.answer2, for: .normal)
        self.textBtn2.setTitleColor(.black, for: .normal)
        self.textBtn2.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        
        self.textBtn3.frame = self.questions3View.bounds
        self.textBtn3.setTitle(text.answer3, for: .normal)
        self.textBtn3.setTitleColor(.black, for: .normal)
        self.textBtn3.addTarget(self, action: #selector(buttonAction3), for: .touchUpInside)

        self.textBtn4.frame = self.questions4View.bounds
        self.textBtn4.setTitle(text.answer4, for: .normal)
        self.textBtn4.setTitleColor(.black, for: .normal)
        self.textBtn4.addTarget(self, action: #selector(buttonAction4), for: .touchUpInside)

        self.questionsView.addSubview(textBtn1)
        self.questions2View.addSubview(textBtn2)
        self.questions3View.addSubview(textBtn3)
        self.questions4View.addSubview(textBtn4)
        self.questionView.addSubview(questionTextLabel)
    }
// MARK: - список вопросов
    var number1 = question1(question: "2+2", answer1: "4", answer2: "5", answer3: "64", answer4: "7")
     var number2 = question1(question: "3+3", answer1: "6", answer2: "9", answer3: "110", answer4: "11")
     var number3 = question1(question: "4+4", answer1: "8", answer2: "13", answer3: "14", answer4: "15")
     var number4 = question1(question: "5+5", answer1: "10", answer2: "17", answer3: "18", answer4: "19")
     var number5 = question1(question: "6+6", answer1: "12", answer2: "21", answer3: "22", answer4: "23")
    
    
    var hard1 = question1(question: "Сколько метров в одной миле?", answer1: "950", answer2: "1609", answer3: "1205", answer4: "1024")
     var hard2 = question1(question: "Какая из этих жидкостей легче остальных?", answer1: "Вода", answer2: "Ртуть", answer3: "Керосин", answer4: "Молоко")
     var hard3 = question1(question: "Сможете узнать уксус по формуле?", answer1: "NaHCO₃", answer2: "C₃H₈O", answer3: "CH₃COOH", answer4: "HOCCH")
     var hard4 = question1(question: "Как называется шестигранник, у которого все грани – параллелограммы?",
                           answer1: "Пирамида", answer2: "Трапеция", answer3: "Конус", answer4: "Параллелепипед")
//    var testQuestions = [number1, number2, number3, number4, number5]
    var currectAnswers = ["4", "6", "8", "10", "12"]
    var hardCurrectAnswers = ["Параллелепипед","CH₃COOH","Керосин","1609"]
     
    
    
    // MARK:- нажатие
    @objc private  func buttonAction1() {
        currectAnswer(text: self.textBtn1.titleLabel?.text ?? "error")
    }
    @objc private  func buttonAction2() {
        currectAnswer(text: self.textBtn2.titleLabel?.text ?? "error")
    }
    @objc private  func buttonAction3() {
        currectAnswer(text: self.textBtn3.titleLabel?.text ?? "error")
    }
    @objc private  func buttonAction4() {
        currectAnswer(text: self.textBtn4.titleLabel?.text ?? "error")
    }
    
    
    //MARK: - смена вопрос/ответ
    func currectAnswer (text: String) {
        
        if currectAnswers.contains(text) || hardCurrectAnswers.contains(text){
            print (self.counter)
                            self.questionsView.removeFromSuperview()
                            self.questions2View.removeFromSuperview()
                            self.questions3View.removeFromSuperview()
                            self.questions4View.removeFromSuperview()
                            self.questionView.removeFromSuperview()

                            UIView.transition(with: self.view, duration: 2, options: .transitionFlipFromBottom, animations: {
               
                                self.addAnswers()
                                self.addQuestions()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {

                                    if self.counter == 0 {
                                        self.addText(text: self.number1)
                                    }
                                    if self.counter == 1 {
                                        self.addText(text: self.number2)
                                    }
                                    if self.counter == 2 {
                                        self.addText(text: self.number3)
                                    }
                                    if self.counter == 3 {
                                        self.addText(text: self.number4)
                                    }
                                })
                                
                            }, completion: { (finished: Bool) in
                            })

                            let alertController = UIAlertController(title: "Congrats!", message: "Правильный ответ!", preferredStyle: .alert)
            //                let alertOk = UIAlertAction(title: "Done", style: .cancel) { (action: UIAlertAction) in }
            //                alertController.addAction(alertOk)
                            self.present(alertController, animated: true, completion: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                                    alertController.dismiss(animated: true, completion: nil)
                                }
                            )})
        }
            else  {
            let result = self.counter
            print ("Result \(result)")
            let alertController = UIAlertController(title: "You Are Wrong, your result:  \(result)", message: "Wrong Answer", preferredStyle: .alert)
            let record = Record(date: Date(), score: result)
            Game.shared.addRecord(record)
            print(Record.self)
            print("total records: \(Game.shared.records.count)")
                    self.present(alertController, animated: true, completion: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                            alertController.dismiss(animated: true, completion: nil)
                            self.navigationController?.popViewController(animated: true)
                            
                        }
                    )})
            
            
            }
            self.counter = self.counter + 1
        }
    }

//MARK: - делегат
extension MainVC: GameSession {
    func didEndGame(withResult currectAnswersTotal: Int) {
      self.navigationController?.popViewController(animated: true)

    }
}
