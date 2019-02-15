//
//  Wage.swift
//  window-shopper
//
//  Created by Zensar on 06/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import Foundation

class Wage {
    
    class func getHours(forWage wage: Double, andPrice price: Double)-> Int {
        return Int(ceil(price/wage))
    }
    
}
