//
//  questionView.swift
//  Millionare
//
//  Created by Sergey on 22.10.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import SwiftUI

struct questionView: View {
    var body: some View {
        VStack {
            Text(number1.question)
                .padding(.top, 100)
            HStack {
                VStack{
                    Button(action: {print("Button Pushed")}) {
                        Answer1Btn()
                    }
                    Button(action: {print("Button Pushed")}) {
                        Answer2Btn()
                    }
                }
                VStack {
                    Button(action: {print("Button Pushed")}) {
                        Answer3Btn()
                    }
                    Button(action: {print("Button Pushed")}) {
                        Answer4Btn()
                    }
                }
            }
                
               
              .padding(.top, 130)
        }
    }
}
struct questionView_Previews: PreviewProvider {
    static var previews: some View {
        questionView()
    }
}

private var number1 = question1(question: "2+2", answer1: "4", answer2: "5", answer3: "6", answer4: "7")
private var number2 = question1(question: "3+3", answer1: "5", answer2: "6", answer3: "7", answer4: "8")
private var number3 = question1(question: "4+4", answer1: "6", answer2: "7", answer3: "8", answer4: "9")
private var number4 = question1(question: "5+5", answer1: "9", answer2: "10", answer3: "11", answer4: "12")
private var number5 = question1(question: "6+6", answer1: "12", answer2: "13", answer3: "14", answer4: "15")

private var allQuestions = [number1, number2, number3, number4, number5]

struct Answer1Btn: View {
var body: some View {
    Text(number1.answer1)
        .frame(width: 200, height: 100, alignment: .center)
        .background(Color.black)
        .foregroundColor(Color.red)
}
}
struct Answer2Btn: View {
var body: some View {
    Text(number1.answer2)
        .frame(width: 200, height: 100, alignment: .center)
        .background(Color.green)
        .foregroundColor(Color.red)
}
}
struct Answer3Btn: View {
var body: some View {
    Text(number1.answer3)
        .frame(width: 200, height: 100, alignment: .center)
        .background(Color.red)
        .foregroundColor(Color.black)
}
}
struct Answer4Btn: View {
var body: some View {
    Text(number1.answer4)
        .frame(width: 200, height: 100, alignment: .center)
        .background(Color.blue)
        .foregroundColor(Color.red)
}
}
func currectAnswer(index: Int) -> question1 {
    for i in index ..< allQuestions.count {
       index = allQuestions[i]
    }
    return index
}
