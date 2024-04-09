//
//  NewsCardComponent.swift
//  F1_News
//
//  Created by Marcelo Amaral Alves on 2024-04-09.
//

import SwiftUI
import Kingfisher

struct NewsCardComponent: View {
    var article: NewsResponse.Article
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage(URL(string: article.urlToImage ?? ""))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 230)
            
            LinearGradient(colors: [Color.clear, Color.black.opacity(0.7)],
                           startPoint: .top, endPoint: .bottom)
            
            
            
        }
        .padding(4)
        .frame(maxWidth: .infinity, maxHeight: 230, alignment: .leading)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

struct NewsCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardComponent(article: NewsResponse.Article(title: "", url: ""))
    }
}
