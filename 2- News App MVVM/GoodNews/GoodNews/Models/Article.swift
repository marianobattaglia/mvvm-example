//
//  Arcticle.swift
//  GoodNews
//
//  Created by Mariano Martin Battaglia on 13/02/2023.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
