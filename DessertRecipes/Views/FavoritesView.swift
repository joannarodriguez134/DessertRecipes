//
//  FavoritesView.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/2/24.
//

import SwiftUI
import CoreData

struct FavoritesView: View {
    @FetchRequest(sortDescriptors: []) var favoriteDesserts: FetchedResults<FavoriteDesserts>
    @EnvironmentObject var dessertService: DessertService
    @State private var recommendedDesserts: [Meals] = []
    
    var body: some View {
        NavigationView {
            List {
                if favoriteDesserts.isEmpty {
                    Text("You don't have any favorite desserts yet. Check out the desserts tab to get started")
                        .padding(.top, 6)
                        .fontWeight(.semibold)
                } else {
                    Section(header: Text("Your Favorites")) {
                        ForEach(favoriteDesserts) { favorite in
                            HStack {
                                Text(favorite.strMeal ?? "Unknown")
                                    .fontWeight(.semibold)
                                Text(favorite.strArea ?? "")
                                    .font(.caption)
                            }
                        }
                    }
                    if recommendedDesserts.isEmpty {
                        Text("Save more desserts to get recommendations!")
                            .padding(.top, 6)
                            .fontWeight(.semibold)
                    } else {
                        Section(header: Text("Recommended")) {
                            ForEach(recommendedDesserts, id: \.id) { dessert in
                                HStack {
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
            .navigationTitle("Favorites")
            .onAppear {
                fetchRecommendedDesserts()
            }
        }
    }
    
    private func fetchRecommendedDesserts() {
            guard !favoriteDesserts.isEmpty else { return }

            Task {
                var favoriteAreas: Set<String> = []

                for favorite in favoriteDesserts {
                    if let idMeal = favorite.id, let recipe = await dessertService.fetchDessertsById(idMeal: idMeal) {
                        if let area = recipe.strArea {
                            favoriteAreas.insert(area)
                        }
                    }
                }

                var recommendations: [Meals] = []
                for dessert in Meals.MOCK_MEALS {
                    if let recipe = await dessertService.fetchDessertsById(idMeal: dessert.id),
                       favoriteAreas.contains(recipe.strArea ?? "") && !favoriteDesserts.contains(where: { $0.strMeal == dessert.strMeal }) {
                        recommendations.append(dessert)
                    }
                }

                DispatchQueue.main.async {
                    recommendedDesserts = recommendations
                }
            }
        }
    
    

}

#Preview {
    FavoritesView()
}
