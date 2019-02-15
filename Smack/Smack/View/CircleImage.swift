//
//  CircleImage.swift
//  Smack
//
//  Created by Zensar on 10/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        setUpView()
    }

}
