//
//  Prototype.swift
//  Millionare
//
//  Created by Sergey on 15.11.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation

protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    func copy() -> Self {
        return type(of: self).init(self )
    }
}
