//
//  NewsDetailsViewModel.swift
//  NewsAppMVVMSwiftUI
//
//  Created by Максим Назаров on 25.10.2024.
//

import Foundation

final class NewsDetailsViewModel: ObservableObject {
    private let news: Article
    
    var newsTitle: String {
        news.title
    }
    
    @Published var newsImageData = Data()
    
    @Published var counter: Int {
        didSet {
            DataManager.shared.saveCounter(for: news.title, with: counter)
        }
    }
    
    var newsDescription: String {
        news.description ?? "No description"
    }
    
    var newsAuthor: String {
        "Author - \(news.author ?? "No author")"
    }
    
    var newsUrl: URL? {
        URL(string: news.url)
    }
    
    init(news: Article) {
        self.news = news
        counter = DataManager.shared.loadCount(for: news.title)
    }
    
    func fetchImageData() {
        NetworkManager.shared.fetchImageData(from: news.urlToImage ?? "") { [unowned self] data in
            newsImageData = data
        }
    }
    
    func increaseCount() {
        counter += 1
    }
}
