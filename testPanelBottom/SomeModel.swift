//
//  SomeModel.swift
//  testPanelBottom
//
//  Created by asdfgh1 on 09/02/16.
//  Copyright © 2016 rshev. All rights reserved.
//

import UIKit

class SomeModel {
    
//    weak var delegate: SomeModelDataSource?
    
    func getImages() -> [UIImage?] {
        return [
            UIImage(named: "dog1"),
            UIImage(named: "dog2"),
            UIImage(named: "dog3"),
            UIImage(named: "dog4"),
        ]
    }
    
}
