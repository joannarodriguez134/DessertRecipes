//
//  MainTabView.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/2/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection = 1

    var body: some View {
        TabView(selection: $selection) {
            ContentView()
                .tag(1)
                .tabItem { Label("Desserts", systemImage: "birthday.cake") }
            
            FavoritesView()
                .tag(2)
                .tabItem { Label("Favorites", systemImage: "star.fill") }
            
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
