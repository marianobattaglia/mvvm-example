//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Mariano Martin Battaglia on 06/03/2023.
//

import Foundation

extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f°",self)
    }
}
