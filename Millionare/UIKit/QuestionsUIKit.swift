//
//  Questions.swift
//  Millionare
//
//  Created by Sergey on 23.10.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class QuestionsUIKit: UIView {
    
        init(x: CGFloat, y: CGFloat, color: UIColor) {
        super.init(frame: .zero)
            self.frame = CGRect(x: x, y: y, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 4)
        self.backgroundColor = color
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
// MARK: - список вопросов


class textQuestions  {
                var number1 = question1(question: "2+2", answer1: "4", answer2: "5", answer3: "64", answer4: "7")
                 var number2 = question1(question: "3+3", answer1: "6", answer2: "9", answer3: "110", answer4: "11")
                 var number3 = question1(question: "4+4", answer1: "8", answer2: "13", answer3: "14", answer4: "15")
                 var number4 = question1(question: "5+5", answer1: "10", answer2: "17", answer3: "18", answer4: "19")
                 var number5 = question1(question: "6+6", answer1: "12", answer2: "21", answer3: "22", answer4: "23")
    //            var number6 = number1.copy()
                
                
                var hard1 = question1(question: "Сколько метров в одной миле?", answer1: "950", answer2: "1609", answer3: "1205", answer4: "1024")
                 var hard2 = question1(question: "Какая из этих жидкостей легче остальных?", answer1: "Вода", answer2: "Ртуть", answer3: "Керосин", answer4: "Молоко")
                 var hard3 = question1(question: "Сможете узнать уксус по формуле?", answer1: "NaHCO₃", answer2: "C₃H₈O", answer3: "CH₃COOH", answer4: "HOCCH")
                 var hard4 = question1(question: "Как называется шестигранник, у которого все грани – параллелограммы?",
                                       answer1: "Пирамида", answer2: "Трапеция", answer3: "Конус", answer4: "Параллелепипед")
            //    var testQuestions = [number1, number2, number3, number4, number5]
                var currectAnswers = ["4", "6", "8", "10", "12"]
                var hardCurrectAnswers = ["Параллелепипед","CH₃COOH","Керосин","1609"]
}
