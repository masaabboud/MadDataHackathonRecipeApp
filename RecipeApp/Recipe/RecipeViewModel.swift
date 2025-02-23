//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Juay Kang Tan on 22/2/25.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []  // List of recipes
    @Published var generatedRecipe: String?  // Holds the generated recipe
    
    // Function to fetch stored recipes from the API
    func fetchRecipes() {
        APIService.shared.fetchRecipes { [weak self] recipes in
            DispatchQueue.main.async {
                self?.recipes = recipes ?? []
            }
        }
    }
    
    // Function to generate a recipe based on user preferences
    func generateRecipe(preferences: String) {
        APIService.shared.generateRecipe(preferences: preferences) { [weak self] recipe in
            DispatchQueue.main.async {
                self?.generatedRecipe = recipe
            }
        }
    }
}
