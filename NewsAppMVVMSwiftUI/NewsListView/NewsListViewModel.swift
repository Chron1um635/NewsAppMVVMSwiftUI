//
//  NewsListViewModel.swift
//  NewsAppMVVMSwiftUI
//
//  Created by Максим Назаров on 25.10.2024.
//

import Foundation

final class NewsListViewModel: ObservableObject {
    @Published var news: [NewsDetailsViewModel] = []
    
    func fetchData() {
        NetworkManager.shared.fetchNews(from: Link.mainUrl.url) { [unowned self] result in
            switch result {
            case .success(let data):
                news = data.articles.map { NewsDetailsViewModel(news: $0) }
            case .failure(let error):
                print(error)
            }
        }
    }
}
