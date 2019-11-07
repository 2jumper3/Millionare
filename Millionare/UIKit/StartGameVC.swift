//
//  StartGameVC.swift
//  Millionare
//
//  Created by Sergey on 06.11.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class StartGameVC: UIViewController {

    var startGameBtn = UIButton()
    var resultBtn    = UIButton()
    var settingsBtn  = UIButton()
    var difficulty: Difficulty = .easy
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        if difficulty == .easy {
            self.view.backgroundColor = .black
        } else {
            self.view.backgroundColor = .red
        }
        
        addActions()
        
        self.startGameBtn.frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 50, y: UIScreen.main.bounds.size.height / 2 - 25, width: 100, height: 50)
        self.startGameBtn.setTitle("Start Game", for: .normal)
        self.startGameBtn.setTitleColor(.white, for: .normal)
        self.startGameBtn.backgroundColor = .green
        
        self.resultBtn.frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 50, y: UIScreen.main.bounds.size.height / 2 + 35, width: 100, height: 50)
        self.resultBtn.setTitle("Results", for: .normal)
        self.resultBtn.setTitleColor(.white, for: .normal)
        self.resultBtn.backgroundColor = .green
        
        self.settingsBtn.frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 50, y: UIScreen.main.bounds.size.height / 2 + 100, width: 100, height: 50)
        self.settingsBtn.setTitle("Settings", for: .normal)
        self.settingsBtn.setTitleColor(.white, for: .normal)
        self.settingsBtn.backgroundColor = .green

        self.view.addSubview(startGameBtn)
        self.view.addSubview(resultBtn)
        self.view.addSubview(settingsBtn)


    }
    private var gameStrategy: QuestionAppearStrategy {
        switch self.difficulty {
        case .easy:
            return EasyStrategy()
        case .hard:
            return HardStrategy()
        }
    }
    


// MARK: - Actions
    func addActions() {
        self.startGameBtn.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        self.resultBtn.addTarget(self, action: #selector(results), for: .touchUpInside)
        self.settingsBtn.addTarget(self, action: #selector(settings), for: .touchUpInside)

    }
    @objc func startGame() {
        let vc = MainVC()
//        vc.difficulty = self.gameStrategy.counterIncrease(counter: 1)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func results() {
        let vc = ResultsVC()
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    @objc func settings() {
        let vc = SettingsVC()
        if self.difficulty == .easy {
            vc.difficultySC.selectedSegmentIndex = 0
        } else {
            vc.difficultySC.selectedSegmentIndex = 1
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
