//
//  NewsDetailsView.swift
//  NewsAppMVVMSwiftUI
//
//  Created by Максим Назаров on 25.10.2024.
//

import SwiftUI
import WebKit


struct NewsDetailsView: View {
    
    @StateObject var viewModel: NewsDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20)
             {
                NewsImageView(
                    imageData: viewModel.newsImageData,
                    size: CGSize(width: 300, height: 200),
                    cornerRadius: 30
                )
                Text(viewModel.newsTitle)
                     .font(.title)
                     .bold()
                     .multilineTextAlignment(.center)
                 Text(viewModel.newsDescription)
                      .font(.headline)
                 Text(viewModel.newsAuthor)
                 NavigationLink(destination: WebView(url: viewModel.newsUrl)) {
                     Text(viewModel.newsUrl?.absoluteString ?? "")
                 }
                 
            }
        }
        .onAppear {
            viewModel.increaseCount()
        }
        .padding()
    }
}

#Preview {
    NewsDetailsView(viewModel: NewsDetailsViewModel(news: Article.getArticle()))
}

struct WebView: UIViewRepresentable {
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let wkWebView = WKWebView()
        if let url = url {
            let request = URLRequest(url: url)
            wkWebView.load(request)
        }
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
