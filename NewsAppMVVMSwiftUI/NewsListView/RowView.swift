//
//  RowView.swift
//  NewsAppMVVMSwiftUI
//
//  Created by Максим Назаров on 25.10.2024.
//

import SwiftUI

struct RowView: View {

    @StateObject var viewModel: NewsDetailsViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            NewsImageView(
                imageData: viewModel.newsImageData,
                size: CGSize(width: 120, height: 120),
                cornerRadius: 10
            )
            
            VStack {
                Text(viewModel.newsTitle)
                HStack {
                    Spacer()
                    Label(viewModel.counter.formatted(), systemImage: "eye")
                        .font(.footnote)
                    .foregroundStyle(.black)
                }
            }
            
        }
    }
}

#Preview {
    RowView(viewModel: NewsDetailsViewModel(news: Article.getArticle()))
}
