//
//  APIService.swift
//  RecipeApp
//
//  Created by Juay Kang Tan on 23/2/25.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private let baseURL = "http://127.0.0.1:10005"  // Update with actual IP if needed
    
    // Fetch stored recipe data
    func fetchRecipes(completion: @escaping ([Recipe]?) -> Void) {
        let url = URL(string: "\(baseURL)/get_recipes")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                var recipes = try JSONDecoder().decode([[String: String]].self, from: data)
                let formattedRecipes = recipes.map { recipeDict in
                    Recipe(
                        name: recipeDict["Recipe_Name"] ?? "Unknown Recipe",
                        ingredients: recipeDict["Ingredients_List"]?.components(separatedBy: ", ") ?? [],
                        directions: recipeDict["Directions"]?.components(separatedBy: ". ") ?? ["No directions provided"]
                    )
                }
                completion(formattedRecipes)
            } catch {
                print("Decoding error: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    // Generate a recipe based on user preferences
    func generateRecipe(preferences: String? = nil, completion: @escaping (Recipe?) -> Void) {
        let url = URL(string: "\(baseURL)/generate_recipe")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let userPreferences = ["preferences": preferences]
        let jsonData = try? JSONSerialization.data(withJSONObject: userPreferences)
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let responseDict = try JSONDecoder().decode([String: String].self, from: data)
                let generatedRecipeText = responseDict["recipe"] ?? "Failed to generate recipe."
                
                // Splitting the response into structured components (you might need to refine this based on the actual response format)
                let lines = generatedRecipeText.components(separatedBy: "\n")
                let name = lines.first ?? ""
                let ingredients = lines.filter { $0.contains("-") }.map { $0.replacingOccurrences(of: "-", with: "").trimmingCharacters(in: .whitespaces) }
                let directions = lines.filter { $0.contains("Step") }
               
                
                let generatedRecipe = Recipe(
                    name: name,
                    ingredients: ingredients,
                    directions: directions.isEmpty ? ["Follow standard cooking steps."] : directions
                )
                
                completion(generatedRecipe)
            } catch {
                print("Decoding error: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
