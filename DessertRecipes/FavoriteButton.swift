//
//  FavoriteButton.swift
//  DessertRecipes
//
//  Created by Joanna Rodriguez on 8/2/24.
//

import SwiftUI

struct FavoriteButton: View {
    @State private var isFavorited = false
    
    
    var body: some View {
        Button(action: {
            isFavorited.toggle()
        }) {
            Image(systemName: isFavorited ? "heart.fill" : "heart")
                .foregroundColor(isFavorited ? .red : .gray)
                .padding(8)
                .background(Color.white.opacity(0.9))
                .clipShape(Circle())
                .shadow(radius: 3)
        }
    }
}


#Preview {
    FavoriteButton()
}
