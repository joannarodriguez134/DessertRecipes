//
//  RecipeDetailsView.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/1/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    let desserts: Meals
    @State private var recipes: Recipes?
    @EnvironmentObject var dessertService: DessertService
    let keyPaths: [KeyPath<Recipes, String?>] = [

        \Recipes.strMeasure1,
         \Recipes.strMeasure2,
         \Recipes.strMeasure3,
         \Recipes.strMeasure4,
         \Recipes.strMeasure5,
         \Recipes.strMeasure6,
         \Recipes.strMeasure7,
         \Recipes.strMeasure8,
         \Recipes.strMeasure9,
         \Recipes.strMeasure10,
         \Recipes.strMeasure11,
         \Recipes.strMeasure12,
         \Recipes.strMeasure13,
         \Recipes.strMeasure14,
         \Recipes.strMeasure15,
         \Recipes.strMeasure16,
         \Recipes.strMeasure17,
         \Recipes.strMeasure18,
         \Recipes.strMeasure19,
         \Recipes.strMeasure20
        ]
    
    var body: some View {
        ScrollView {
            if let recipes = recipes {
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
                    

                        ForEach(0..<keyPaths.count, id: \.self) { index in
                            if let strMeasure =  recipes[keyPath: keyPaths[index]], !strMeasure.isEmpty {
                                Text(strMeasure)
                            }
                        }
                    
                }
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 5)
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            Task {
                if let fetchedRecipes = await dessertService.fetchDessertsById(idMeal: desserts.id) {
                    self.recipes = fetchedRecipes
                }
            }
        }
    }
}

#Preview {
    RecipeDetailsView(desserts: Meals.MOCK_MEALS[1])
        .environmentObject(DessertService())
}

