//
//  Game.swift
//  Millionare
//
//  Created by Sergey on 06.11.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation

final class Game {
    static var shared = Game()
     private let recordsCaretaker = RecordsCare()
       private(set) var records: [Record] {
           didSet {
               recordsCaretaker.save(records: records) //каждый раз при изменении records будет созраняться новое сотсояние
           }
       }
       private init () {
           self.records = self.recordsCaretaker.load()
           
       }
    
    func addRecord (_ record: Record) {
        self.records.append(record)
    }
    func clearScore () {
        self.records = []
    }
}


//MARK: - Делегат для хранения сессии
protocol GameSession: class {
    func didEndGame(withResult currectAnswersTotal: Int)
}

class RecordsCare {
    private let encode = JSONEncoder()
    private let decode = JSONDecoder()
    
    private let key = "redords"
    
    func save(records: [Record]) {
        do {
            let data = try self.encode.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print (error)
        }
    }
    
    func load() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decode.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
struct Record: Codable {
    let date: Date
    let score: Int
}
