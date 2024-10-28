//
//  NetworkManager.swift
//  NewsAppMVVMSwiftUI
//
//  Created by Максим Назаров on 25.10.2024.
//

import Foundation
import Alamofire

enum Link {
    case mainUrl
    
    var url: URL {
        switch self {
        case .mainUrl:
            return URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=dfe5b2f4813e4781a9f27647aa6fd1a7")!
        }
    }
}
enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchNews(from url: URL, completion: @escaping(Result<News, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: News.self) { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchImageData(from url: String, completion: @escaping(Data) -> Void){
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    completion(data)
                case .failure(let error):
                    print(error)
                }
            }
    }
    func fetchImageDat(from url: String) throws -> Data {
        guard let imageURL = URL(string: url) else { throw NetworkError.invalidURL }
        guard let imageData = try? Data(contentsOf: imageURL) else { throw NetworkError.noData }
        return imageData
    }
}
