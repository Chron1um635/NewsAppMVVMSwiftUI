//
//  ContentView.swift
//  NewsAppMVVMSwiftUI
//
//  Created by Максим Назаров on 25.10.2024.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject private var viewModel = NewsListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.news, id: \.newsTitle) { newsListDetailViewModel in
                NavigationLink(destination: NewsDetailsView(viewModel: newsListDetailViewModel)) {
                    RowView(viewModel: newsListDetailViewModel)
                }
                .task {
                    newsListDetailViewModel.fetchImageData()
                }
            }
            .navigationTitle("News")
        }
        .task {
            viewModel.fetchData()
        }
        .refreshable {
            Task {
                viewModel.fetchData()
            }
        }
    }
}

#Preview {
    NewsListView()
}
