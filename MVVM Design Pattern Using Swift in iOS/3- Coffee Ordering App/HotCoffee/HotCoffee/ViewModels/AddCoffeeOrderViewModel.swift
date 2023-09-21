//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by Mariano Martin Battaglia on 17/02/2023.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var email: String?
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}
