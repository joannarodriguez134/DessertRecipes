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
    @State private var isFavorited = false
    @State var selectedTab = 0
    @EnvironmentObject var dessertService: DessertService
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var favoriteDesserts: FetchedResults<FavoriteDesserts>
    let measurementKeyPaths: [KeyPath<Recipes, String?>] = [

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
    
    let ingredientsKeyPaths: [KeyPath<Recipes, String?>] = [

        \Recipes.strIngredient1,
         \Recipes.strIngredient2,
         \Recipes.strIngredient3,
         \Recipes.strIngredient4,
         \Recipes.strIngredient5,
         \Recipes.strIngredient6,
         \Recipes.strIngredient7,
         \Recipes.strIngredient8,
         \Recipes.strIngredient9,
         \Recipes.strIngredient10,
         \Recipes.strIngredient11,
         \Recipes.strIngredient12,
         \Recipes.strIngredient13,
         \Recipes.strIngredient14,
         \Recipes.strIngredient15,
         \Recipes.strIngredient16,
         \Recipes.strIngredient17,
         \Recipes.strIngredient18,
         \Recipes.strIngredient19,
         \Recipes.strIngredient20
        ]
    
    var body: some View {
        ScrollView {
            if let recipes = recipes {
                VStack(spacing: 20) {
                    AsyncImage(url: URL(string: recipes.strMealThumb))
                        .scaledToFill()
                        .frame(width: 350, height: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    HStack(spacing: 7) {
                        Text(recipes.strMeal)
                            .fontWeight(.heavy)
                            .font(.largeTitle)
                        
                        Button(action: {
                            toggleFavoriteStatus()
                            
                        }) {
                            Image(systemName: isFavorited ? "heart.fill" : "heart")
                                .foregroundColor(isFavorited ? .red : .gray)
                                .padding(8)
                                .background(Color.white.opacity(0.9))
                                .clipShape(Circle())
                                .shadow(radius: 3)
                        }
                    }
                        
        
                    Picker("", selection: $selectedTab) {
                        Text("Instructions").tag(0)
                        Text("Ingredients & Measurements").tag(1)
                    }
                    .pickerStyle(.segmented)
                    
                    if selectedTab == 0 {
                        Text(recipes.strInstructions)
                            .font(.caption)
                    } else {
                        VStack(alignment: .leading, spacing: 5) {
                                                ForEach(Array(zip(measurementKeyPaths, ingredientsKeyPaths)), id: \.0) { (measureKeyPath, ingredientKeyPath) in
                                                    if let measure = recipes[keyPath: measureKeyPath], !measure.isEmpty,
                                                       let ingredient = recipes[keyPath: ingredientKeyPath], !ingredient.isEmpty {
                                                        HStack {
                                                            Text(ingredient)
                                                            Text(measure)
                                                        }
                                                        .foregroundStyle(Color.gray)
                                                    }
                                                }
                                            }
                    }
                        
                    
                }
                .padding(.horizontal, 10)
                .padding(.vertical)
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            Task {
                if let fetchedRecipes = await dessertService.fetchDessertsById(idMeal: desserts.id) {
                    self.recipes = fetchedRecipes
                    self.isFavorited = favoriteDesserts.contains { $0.id == desserts.id }
                }
            }
        }
    }

    func toggleFavoriteStatus() {
            if isFavorited {
                // Remove from favorites
                if let favorite = favoriteDesserts.first(where: { $0.id == desserts.id }) {
                    moc.delete(favorite)
                }
            } else {
                // Add to favorites
                let newFavorite = FavoriteDesserts(context: moc)
                newFavorite.id = desserts.id
                newFavorite.strMeal = desserts.strMeal
                newFavorite.isFavorite = true
            }
            isFavorited.toggle()
            try? moc.save()
        }
}

#Preview {
    RecipeDetailsView(desserts: Meals.MOCK_MEALS[1])
        .environmentObject(DessertService())
}

