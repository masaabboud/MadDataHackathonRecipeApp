import Foundation
import SwiftUI

struct Recipe: Identifiable, Codable {
    let id = UUID()
    let name: String
    let ingredients: [String]
    let directions: [String]
}

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var generatedRecipe: Recipe? = nil
    
    private let apiService = APIService.shared
    
    // Fetch stored recipes
    func fetchRecipes() {
        apiService.fetchRecipes { [weak self] fetchedRecipes in
            DispatchQueue.main.async {
                self?.recipes = fetchedRecipes ?? []
            }
        }
    }
    
    func generateRecipe(preferences: String) {
        apiService.generateRecipe(preferences: preferences) { [weak self] response in
            DispatchQueue.main.async {
                if let recipe = response {
                    self?.generatedRecipe = recipe
                } else {
                    print("Error: Failed to generate recipe.")
                }
            }
        }
    }
    
    // Convert API response into a Recipe model
    private func parseGeneratedRecipe(_ response: String) {
        let lines = response.components(separatedBy: "\n").filter { !$0.isEmpty }
        
        var name = "Generated Recipe"
        var ingredients: [String] = []
        var directions: [String] = []
        var section: String? = nil
        
        for line in lines {
            if line.lowercased().contains("ingredients") {
                section = "ingredients"
                continue
            } else if line.lowercased().contains("directions") {
                section = "directions"
                continue
            }
            
            switch section {
            case "ingredients":
                ingredients.append(line.trimmingCharacters(in: .whitespaces))
            case "directions":
                directions.append(line.trimmingCharacters(in: .whitespaces))
            default:
                name = line
            }
        }
        
        self.generatedRecipe = Recipe(
            name: name,
            ingredients: ingredients,
            directions: directions
        )
    }
}
