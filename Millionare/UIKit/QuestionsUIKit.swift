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
