//
//  ContentView.swift
//  F1_News
//
//  Created by Marcelo Amaral Alves on 2024-04-07.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NewsView()
                .tag(1)
            
            SearchView()
                .tag(2)
            
            SettingsView()
                .tag(3)
        }
        .overlay(alignment: .bottom) {
            CustomTabView(tabSelection: $tabSelection)
        }
    }
}

#Preview {
    ContentView()
}
