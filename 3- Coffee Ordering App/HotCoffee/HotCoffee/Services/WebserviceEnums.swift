//
//  WebserviceEnums.swift
//  HotCoffee
//
//  Created by Mariano Martin Battaglia on 17/02/2023.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}
