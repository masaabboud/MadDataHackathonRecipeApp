//
//  APISwift.swift
//  RecipeApp
//
//  Created by Juay Kang Tan on 22/2/25.
//

import Foundation

// Define the Recipe struct that your API will return
struct Recipe: Codable {
    let name: String
    let ingredients: String
    let calories: Int
}

// Define the UserPreferences struct for the request body
struct UserPreferences: Codable {
    let preferences: String
}

class APIService {
    static let shared = APIService()
    
    private let baseURL = "http://127.0.0.1:10005"  // Replace with actual IP or localhost
    
    // Fetch stored recipe data
    func fetchRecipes(completion: @escaping ([Recipe]?) -> Void) {
        let url = URL(string: "\(baseURL)/get_recipes")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)  // Returning nil when there is no data
                return
            }
            
            let recipes = try? JSONDecoder().decode([Recipe].self, from: data)
            completion(recipes)
        }.resume()
    }
    
    // Generate a recipe based on user preferences
    func generateRecipe(preferences: String, completion: @escaping (String?) -> Void) {
        let url = URL(string: "\(baseURL)/generate_recipe")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let userPreferences = UserPreferences(preferences: preferences)
        let jsonData = try? JSONEncoder().encode(userPreferences)
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let response = try? JSONDecoder().decode([String: String].self, from: data)
            completion(response?["recipe"])
        }.resume()
    }
}
