//
//  MainVC.swift
//  Millionare
//
//  Created by Sergey on 23.10.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    

    
    var counter       = Int()
    var questionsView:  Answers!
    var questions2View: Answers!
    var questions3View: Answers!
    var questions4View: Answers!
    var questionView:   QuestionsUIKit!
    var difficulty:     Difficulty!
    var gameState:      GameState!
    
    
    
    var restartBtn = UIButton()
    var textBtn1   = UIButton()
    var textBtn2   = UIButton()
    var textBtn3   = UIButton()
    var textBtn4   = UIButton()
    let questionTextLabel = UILabel()

    var testQuestions: NSArray = []
    
    let testText = textQuestions()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        addAnswers()
        addQuestions()
        addBtns()
        self.counter = 0
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if self.difficulty == .easy {
            addText(text: testText.number1)
        }
        if self.difficulty == .hard {
            addText(text: testText.hard1)
        }

    }
    
    //MARK: - создание VIEW
    private func addAnswers() {
        
        let answer1 = Answers(x: 0, y: UIScreen.main.bounds.size.height / 2, color: .question)
        self.questionsView = answer1
        let answer2 = Answers(x: questionsView.bounds.width , y: UIScreen.main.bounds.size.height / 2, color: .question)
        self.questions2View = answer2
        let answer3 = Answers(x: 0, y: UIScreen.main.bounds.size.height / 2 + questionsView.bounds.height, color: .question)
        self.questions3View = answer3
        let answer4 = Answers(x: questionsView.bounds.width, y: UIScreen.main.bounds.size.height / 2 + questionsView.bounds.height, color: .question)
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
    
    
    private func addBtns() {
        self.restartBtn.frame = CGRect(x: 10, y: 100, width: 80, height: 20)
        self.restartBtn.backgroundColor = .red
        self.restartBtn.setTitle("Restart", for: .normal)
        self.restartBtn.addTarget(self, action: #selector(restart), for: .touchUpInside)
        self.view.addSubview(self.restartBtn)

    }
    //MARK: - добавление текста вопросов/ответов
    
    
     func addText (text: question1) {

        self.questionTextLabel.frame = self.questionView.bounds
        self.questionTextLabel.text  = text.question
        self.questionTextLabel.textAlignment = .center
        
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

     
    
    
    // MARK:- нажатие
    
    @objc func restart() {
        self.counter = 0
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc  func buttonAction1() {
        currectAnswer(text: self.textBtn1.titleLabel?.text ?? "error")
    }
    @objc   func buttonAction2() {
        currectAnswer(text: self.textBtn2.titleLabel?.text ?? "error")
    }
    @objc   func buttonAction3() {
        currectAnswer(text: self.textBtn3.titleLabel?.text ?? "error")
    }
    @objc   func buttonAction4() {
        currectAnswer(text: self.textBtn4.titleLabel?.text ?? "error")
    }
    
    
    //MARK: - смена вопрос/ответ
    func currectAnswer (text: String) {
        
        if self.testText.currectAnswers.contains(text) || self.testText.hardCurrectAnswers.contains(text){
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
                                    if self.difficulty == .easy {
                                        if self.counter == 0 {
                                            self.addText(text: self.testText.number1)
                                        }
                                        if self.counter == 1 {
                                            self.addText(text: self.testText.number2)
                                        }
                                        if self.counter == 2 {
                                            self.addText(text: self.testText.number3)
                                        }
                                        if self.counter == 3 {
                                            self.addText(text: self.testText.number4)
                                        }
                                    }
                                    if self.difficulty == .hard {
                                            if self.counter == 0 {
                                                self.addText(text: self.testText.hard1)
                                            }
                                            if self.counter == 1 {
                                                self.addText(text: self.testText.hard2)
                                            }
                                            if self.counter == 2 {
                                                self.addText(text: self.testText.hard3)
                                            }
                                            if self.counter == 3 {
                                                self.addText(text: self.testText.hard4)
                                            }
                                        }
                                })
                                
                            }, completion: { (finished: Bool) in
                            })

                            let alertController = UIAlertController(title: "Congrats!", message: "Правильный ответ!", preferredStyle: .alert)
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
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
