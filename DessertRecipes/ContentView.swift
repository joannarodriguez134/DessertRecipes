//
//  ContentView.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/1/24.
//

import SwiftUI

struct ContentView: View {
//    let desserts: Meals

    var body: some View {
        NavigationStack {
            List {
                ForEach(Meals.MOCK_MEALS) { dessert in
                    ForEach(Recipes.MOCK_Recipes) {
                        recipe in
                        
                        NavigationLink {
                            RecipeDetailsView(desserts: dessert, recipes: recipe)
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
            }
        }
    }
}

#Preview {
    ContentView()
}
