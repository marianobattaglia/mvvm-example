//
//  String+Extensions.swift
//  GoodWeather
//
//  Created by Mariano Martin Battaglia on 02/03/2023.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
