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

    var body: some View {
        NavigationStack {
            List {
                ForEach(desserts) { dessert in
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
        }
    }
}

#Preview {
    ContentView()
}
