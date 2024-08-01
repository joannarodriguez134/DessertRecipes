//
//  RecipeDetailsView.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/1/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    let desserts: Meals
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: desserts.strMealThumb))
                .scaledToFill()
                .frame(width: 350, height: 350)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(desserts.strMeal)
                .fontWeight(.heavy)
                .font(.largeTitle)
            
            
        }
        
    }
}

#Preview {
    RecipeDetailsView(desserts: Meals.MOCK_MEALS[1])
}
