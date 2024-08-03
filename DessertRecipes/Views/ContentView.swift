//
//  ContentView.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/1/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dessertService = DessertService()
    @State var desserts = [Meals]()
    @State private var searchText = ""
    
    var searchResults: [Meals] {
        let filtered = desserts.filter { desserts in
            let matchesSearchTerm = searchText.isEmpty || desserts.strMeal.localizedCaseInsensitiveContains(searchText)
            
            return matchesSearchTerm
        }
        return filtered
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults) { dessert in
                    NavigationLink {
                        RecipeDetailsView(desserts: dessert)
                            .environmentObject(dessertService)
                    } label: {
                        HStack(spacing: 10) {
                            AsyncImage(url: URL(string: dessert.strMealThumb))
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            Text(dessert.strMeal)
                                .fontWeight(.semibold)
                        }
                    }
                    
                   
                }
            }
            .task {
                desserts = await dessertService.fetchDesserts()
            }
            .navigationTitle("Desserts")
            .searchable(text: $searchText, prompt: "Search for a dessert...")
        }
    }
}

#Preview {
    ContentView()
}
