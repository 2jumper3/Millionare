//
//  ResultsVC.swift
//  Millionare
//
//  Created by Sergey on 06.11.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {
    
    
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)

        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .white
            
            self.view.addSubview(self.tableView)
            self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "resultCell")
            self.tableView.dataSource = self

            
            self.updateLayout(with: self.view.frame.size)
        }
    
    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }

    }
    extension ResultsVC: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Game.shared.records.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell")
            let record = Game.shared.records[indexPath.row]
            let dateFormat = DateFormatter()
            dateFormat.dateStyle = .short
            
            cell?.textLabel?.text = "\(dateFormat.string(from: record.date)) : \(record.score)"
            
            return cell!
        }
        

}
