//
//  RecipeDetailsView.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/1/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    let desserts: Meals
    let recipes: Recipes
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                AsyncImage(url: URL(string: recipes.strMealThumb))
                    .scaledToFill()
                    .frame(width: 350, height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text(recipes.strMeal)
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                
                Text(recipes.strInstructions)

                    .font(.caption)
                
                
            }
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 5)
        }
        
    }
}

#Preview {
    RecipeDetailsView(desserts: Meals.MOCK_MEALS[1], recipes: Recipes.MOCK_Recipes[1])
}
