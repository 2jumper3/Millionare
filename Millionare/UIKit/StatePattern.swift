//
//  StatePattern.swift
//  Millionare
//
//  Created by Sergey on 14.11.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation
import UIKit

public protocol GameState {
    var test: String { get }

    func addText(question: String, answer1: String, answer2: String, answer3: String, answer4: String)
}

class HardMode:GameState {
    private var vc: MainVC?

    var test = "Test"
    
    var questionFirst = question1(question: "Сколько метров в одной миле?", answer1: "950", answer2: "1609", answer3: "1205", answer4: "1024")
     var hard2 = question1(question: "Какая из этих жидкостей легче остальных?", answer1: "Вода", answer2: "Ртуть", answer3: "Керосин", answer4: "Молоко")
     var hard3 = question1(question: "Сможете узнать уксус по формуле?", answer1: "NaHCO₃", answer2: "C₃H₈O", answer3: "CH₃COOH", answer4: "HOCCH")
     var hard4 = question1(question: "Как называется шестигранник, у которого все грани – параллелограммы?",
                           answer1: "Пирамида", answer2: "Трапеция", answer3: "Конус", answer4: "Параллелепипед")
    
    
    func addText(question: String, answer1: String, answer2: String, answer3: String, answer4: String) {
        self.vc?.questionTextLabel.frame = (self.vc?.questionView.bounds)!
        self.vc?.questionTextLabel.text  = question
        self.vc?.questionTextLabel.textAlignment = .center
               
        self.vc?.textBtn1.frame = (self.vc?.questionsView.bounds)!
        self.vc?.textBtn1.setTitle(answer1, for: .normal)
        self.vc?.textBtn1.setTitleColor(.black, for: .normal)
        self.vc?.textBtn1.addTarget(self, action: #selector(self.vc?.buttonAction1), for: .touchUpInside)
               
        self.vc?.textBtn2.frame = (self.vc?.questionsView.bounds)!
        self.vc?.textBtn2.setTitle(answer2, for: .normal)
        self.vc?.textBtn2.setTitleColor(.black, for: .normal)
        self.vc?.textBtn2.addTarget(self, action: #selector(self.vc?.buttonAction2), for: .touchUpInside)
               
               self.vc?.textBtn3.frame = (self.vc?.questionsView.bounds)!
               self.vc?.textBtn3.setTitle(answer3, for: .normal)
               self.vc?.textBtn3.setTitleColor(.black, for: .normal)
               self.vc?.textBtn3.addTarget(self, action: #selector(self.vc?.buttonAction3), for: .touchUpInside)
        
               self.vc?.textBtn4.frame = (self.vc?.questionsView.bounds)!
               self.vc?.textBtn4.setTitle(answer4, for: .normal)
               self.vc?.textBtn4.setTitleColor(.black, for: .normal)
               self.vc?.textBtn4.addTarget(self, action: #selector(self.vc?.buttonAction4), for: .touchUpInside)

              
    }
    

}

class EasyMode:GameState {
    var test: String = ""
    
    private var viewController: MainVC?

    func addText(question: String, answer1: String, answer2: String, answer3: String, answer4: String) {
        
    }


    
}

