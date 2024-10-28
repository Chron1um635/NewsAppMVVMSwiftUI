//
//  News.swift
//  NewsAppMVVMSwiftUI
//
//  Created by Максим Назаров on 25.10.2024.
//

import Foundation

struct News: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let urlToImage: String?
    let url: String
    
    
    static func getArticle() -> Article {
        Article(source: Source(name: ""), author: "Dada", title: "Title", description: "desc", urlToImage: "", url: "")
    }
}

struct Source: Decodable {
    let name: String
}
