//
//  ContentView.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/1/24.
//

import SwiftUI

struct ContentView: View {
//    let desserts: Meals
//    @StateObject private var dessertService = DessertService()
    @EnvironmentObject var dessertService: DessertService
    @State var desserts = [Meals]()

    var body: some View {
        NavigationStack {
            List {
                ForEach(desserts) { dessert in
                    Text(dessert.strMeal)
//                    ForEach(Recipes.MOCK_Recipes) {
//                        recipe in
//                        
//                        NavigationLink {
//                            RecipeDetailsView(desserts: dessert, recipes: recipe)
//                        } label: {
//                            HStack(spacing: 10) {
//                                AsyncImage(url: URL(string: dessert.strMealThumb))
//                                    .scaledToFill()
//                                    .frame(width: 50, height: 50)
//                                    .clipShape(Circle())
//                                Text(dessert.strMeal)
//                                    .fontWeight(.semibold)
//                            }
//                    }
//                    
//                    }
                }
            }
            .task {
                desserts = await dessertService.fetchDesserts()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
