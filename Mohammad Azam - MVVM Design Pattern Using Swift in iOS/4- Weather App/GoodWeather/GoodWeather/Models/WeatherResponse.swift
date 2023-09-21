//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by Mariano Martin Battaglia on 02/03/2023.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
