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
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 16)
                
                Text(article.description ?? "")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .bold()
                    .lineLimit(1)
                    .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 4)
                
            }
            
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
