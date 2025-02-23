//
//  RecipeViewOne.swift
//  RecipeApp
//
//  Created by Juay Kang Tan on 22/2/25.
//

import SwiftUI

struct RecipeViewOne: View {
    @ObservedObject var viewModel: RecipeViewModel  // Observe changes in the ViewModel
    
    var body: some View {
        VStack {
            Text("Generated Recipe")
                .font(.headline)
            
            // Display the generated recipe, if available
            if let generatedRecipe = viewModel.generatedRecipe {
                Text(generatedRecipe)
                    .font(.title)
                    .bold()
                    .padding()
            }
            
            // Display the list of latest recipes
            Text("Latest Recipes")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.recipes, id: \.name) { recipe in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 150, height: 100)
                            .overlay(
                                Text(recipe.name)
                                    .foregroundColor(.black)
                                    .bold()
                            )
                    }
                }
            }
            .padding(.vertical)
        }
        .padding()
        .onAppear {
            viewModel.fetchRecipes()  // Fetch recipes when this view appears, if needed
        }
    }
}
