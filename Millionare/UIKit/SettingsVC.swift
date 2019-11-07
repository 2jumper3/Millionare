//
//  SettingsVC.swift
//  Millionare
//
//  Created by Sergey on 07.11.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    var difficultySC = UISegmentedControl(items: ["Easy", "Hard"])
    var saveBtn  = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.saveBtn.frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 50, y: UIScreen.main.bounds.size.height / 2 - 25, width: 100, height: 50)
        self.saveBtn.setTitle("Save", for: .normal)
        self.saveBtn.setTitleColor(.white, for: .normal)
        self.saveBtn.backgroundColor = .green
        self.saveBtn.addTarget(self, action: #selector(save), for: .touchUpInside)


//        self.difficultySC.selectedSegmentIndex = 1
        self.difficultySC.tintColor = .white
        self.difficultySC.backgroundColor = .gray
        self.difficultySC.frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 100, y: 200, width: 200, height: 100)
        
        self.view.addSubview(self.saveBtn)
        self.view.backgroundColor = .black
        self.view.addSubview(self.difficultySC)
    }

    
    private var selectedDifficulty:Difficulty {
        switch self.difficultySC.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .hard
        default:
            return .easy
        }
    }
    
    @objc func save() {
        let vc = StartGameVC()
        vc.difficulty = self.selectedDifficulty
           self.navigationController?.pushViewController(vc, animated: true)
            
       }
}
