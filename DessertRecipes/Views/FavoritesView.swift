//
//  FavoritesView.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/2/24.
//

import SwiftUI

struct FavoritesView: View {
    @FetchRequest(sortDescriptors: []) var favoriteDesserts: FetchedResults<FavoriteDesserts>


    var body: some View {
        NavigationView {
            List {
                ForEach(favoriteDesserts) {
                    favorite in
                    Text(favorite.strMeal ?? "unknown")
                   
                }
            }
        }.navigationTitle("Favorites")
    }
}

#Preview {
    FavoritesView()
}
