//
//  Difficulty.swift
//  Millionare
//
//  Created by Sergey on 07.11.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation
import UIKit


//MARK: - Паттерн Strategy

enum Difficulty  {
    case easy, hard
}
protocol QuestionAppearStrategy {
    func counterIncrease (counter: Int) -> Int
}

final class EasyStrategy: QuestionAppearStrategy {
    func counterIncrease(counter: Int) -> Int  {
        let newCounter = counter  + 1
        return newCounter
    }
    

}

final class HardStrategy: QuestionAppearStrategy {
    func counterIncrease(counter: Int) -> Int {
        
        var temp = [0,1,2,3]
        var newCounter = temp[counter]
        temp.firstIndex(of: 3)
        
        return newCounter
    }
    

}
