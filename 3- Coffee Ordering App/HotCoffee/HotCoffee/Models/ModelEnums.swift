//
//  Enums.swift
//  HotCoffee
//
//  Created by Mariano Martin Battaglia on 17/02/2023.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espresso
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}
