//
//  Questions.swift
//  Millionare
//
//  Created by Sergey on 22.10.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import SwiftUI
import Foundation

struct question1 {
    var question = " Question number 1"
    var answer1 = "answer1"
    var answer2 = "answer2"
    var answer3 = "answer3"
    var answer4 = "answer4"
    
    
    
    
    func currectAnswer(answer: String){
        for i in 0 ..< currectAnswers.count {
            if answer == currectAnswers[i] {
            print("currect")
//            addNavigationLink()
            }
        }
 
        print("lalala")
    }
}





var number1 = question1(question: "2+2", answer1: "4", answer2: "5", answer3: "6", answer4: "7")
 var number2 = question1(question: "3+3", answer1: "8", answer2: "9", answer3: "10", answer4: "11")
 var number3 = question1(question: "4+4", answer1: "12", answer2: "13", answer3: "14", answer4: "15")
 var number4 = question1(question: "5+5", answer1: "16", answer2: "17", answer3: "18", answer4: "19")
 var number5 = question1(question: "6+6", answer1: "20", answer2: "21", answer3: "22", answer4: "23")
var currectAnswers = ["4", "6", "8", "10", "12"]
 var allQuestions = [number1, number2, number3, number4, number5]
