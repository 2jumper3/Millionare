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
    func addText(question: String, answer1: String, answer2: String, answer3: String, answer4: String) {
        
    }
    
    private var vc: MainVC?

    var test = "Test"
    

    
    

}

class EasyMode:GameState {
    var test: String = ""
    
    private var viewController: MainVC?

    func addText(question: String, answer1: String, answer2: String, answer3: String, answer4: String) {
        
    }


    
}

