//
//  DataService.swift
//  coder-swag
//
//  Created by Zensar on 06/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import Foundation

class DataService {
    //Signelton
    
    static let instance = DataService()
    private let categories = [
        Category(title: "SHIRTS", imageName: "shirts.png"),
        Category(title: "HOODIES", imageName: "hoodies.png"),
        Category(title: "HATS", imageName: "hats.png"),
        Category(title: "DIGITAL", imageName: "digital.png")
    ]
    
    private let hats = [
        Product(title: "Developer Logo Graphic Beanie", price: "$18", imageName: "hat01.png"),
        Product(title: "Developer Logo Black Hat", price: "$22", imageName: "hat02.png"),
        Product(title: "Developer Logo White Hat", price: "$21", imageName: "hat03.png"),
        Product(title: "Developer Logo SnapBack", price: "$20", imageName: "hat04.png"),
    ]
    
    private let hoodies = [
        Product(title: "Developer Logo Hoodies Gray", price: "$18", imageName: "hoodie01.png"),
        Product(title: "Developer Logo Black Hoodies", price: "$22", imageName: "hoodie02.png"),
        Product(title: "Developer Logo White Hoodies", price: "$21", imageName: "hoodie03.png"),
        Product(title: "Developer Logo Hoodies Red", price: "$20", imageName: "hoodie04.png"),
        ]
    
    private let shirts = [
        Product(title: "Developer Logo Shirt Grey", price: "$18", imageName: "shirt01.png"),
        Product(title: "Developer Logo Black Shirt", price: "$22", imageName: "shirt02.png"),
        Product(title: "Developer Logo White Shirt", price: "$21", imageName: "shirt03.png"),
        Product(title: "Hustle Delegate Shirt", price: "$20", imageName: "shirt04.png"),
        Product(title: "KickFlip Studios Black ", price: "$20", imageName: "shirt05.png"),
        ]
    
    private let digitalGoods = [Product]()
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getProduct(forCategoryTitle title: String )-> [Product]{
        switch title {
        case "SHIRT":
            return getShirts()
            
        case "HOODIES":
            return getHoodies()
            
        case "HATS":
            return getHats()
        
        case "DIGITAL":
            return getDigitalGoods()
            
        default:
            return getShirts()
        }
        
    }
    
    func getHats()-> [Product]{
        return hats
    }
    
    func getHoodies()->[Product]{
        return hoodies
    }
    func getShirts() -> [Product]{
        return shirts
    }
    func getDigitalGoods() -> [Product] {
        return digitalGoods
    }
}
