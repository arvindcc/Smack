//
//  BorderButton.swift
//  app-swoosh
//
//  Created by Zensar on 03/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
    }

}
