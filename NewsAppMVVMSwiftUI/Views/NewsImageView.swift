//
//  NewsImageView.swift
//  NewsAppMVVMSwiftUI
//
//  Created by Максим Назаров on 25.10.2024.
//

import SwiftUI

struct NewsImageView: View {
    
    var imageData: Data
    
    var size: CGSize
    var cornerRadius: CGFloat
    
    var body: some View {
        getImage()
            .resizable()
            .frame(width: size.width, height: size.height)
            .cornerRadius(cornerRadius)
    }
    
    private func getImage() -> Image {
        guard let uiImage = UIImage(data: imageData) else { return Image(systemName: "photo")}
        return Image(uiImage: uiImage)
    }
}

#Preview {
    NewsImageView(
        imageData: Data() ,
        size: CGSize(width: 230, height: 150),
        cornerRadius: 30
    )
}
