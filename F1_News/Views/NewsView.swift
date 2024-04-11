import SwiftUI

struct NewsView: View {
    var newsManager = NewsManager()
    @State private var articles = [NewsResponse.Article]()
    @State private var isLoading = true
    @State private var selectedSegment = 0
    
    var filteredArticles: [NewsResponse.Article] {
        if selectedSegment == 0 {
            return articles
        } else {
            let sentiment = selectedSegment == 1 ? "Positive" : "Negative"
            return articles.filter { predictSentiment(text: $0.title) == sentiment }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedSegment) {
                    Text("All News").tag(0)
                    Text("Good News").tag(1)
                    Text("Bad News").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                ScrollView {
                    if !isLoading {
                        ForEach(filteredArticles) { article in
                            let type = predictSentiment(text: article.title)
                            NavigationLink(destination: ArticleView(article: article)) {
                                NewsCardComponent(article: article, type: type ?? "Neutral")
                            }
                        }
                    } else {
                        ProgressView()
                    }
                }
            }
            .navigationTitle("News Feed")
            .preferredColorScheme(.dark)
            .onAppear {
                newsManager.getNews(category: "general") { newsResponse in
                    articles = newsResponse
                    isLoading = false
                }
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

struct ArticleView: View {
    var article: NewsResponse.Article
    
    var body: some View {
        // Implemente a visualização da visualização de artigo aqui
        Text(article.title)
    }
}

func predictSentiment(text: String) -> String {
    // Implemente a lógica para prever o sentimento do texto aqui
    return "Neutral" // Retorna um valor padrão para demonstração
}
