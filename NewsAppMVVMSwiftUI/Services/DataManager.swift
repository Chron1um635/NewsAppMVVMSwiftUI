//
//  DataManager.swift
//  NewsAppMVVMSwiftUI
//
//  Created by Максим Назаров on 26.10.2024.
//

import Foundation

final class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func saveCounter(for news: String, with counter: Int) {
        userDefaults.set(counter, forKey: news)
    }
    
    func loadCount(for news: String) -> Int {
        userDefaults.integer(forKey: news)
    }
}
