//
//  Category.swift
//  coder-swag
//
//  Created by Zensar on 06/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
