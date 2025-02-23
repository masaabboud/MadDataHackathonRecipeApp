import SwiftUI

struct RecipeView: View {
    @StateObject private var viewModel = RecipeViewModel()  // Use the view model for data binding
    @State private var selectedCuisine: String? = nil
    @State private var ingredients: [String] = []
    @State private var newIngredient: String = ""
    
    var cuisines = ["Mexican", "Italian", "Indian", "Chinese"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("What type of cuisine do you want?")
                .font(.title)
                .bold()
            
            HStack {
                ForEach(cuisines, id: \.self) { cuisine in
                    Button(action: {
                        selectedCuisine = cuisine
                    }) {
                        Text(cuisine.lowercased())
                            .padding()
                            .background(selectedCuisine == cuisine ? Color.orange : Color.clear)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                    }
                }
            }
            
            Text("What ingredients do you have?")
                .font(.title2)
                .bold()
            
            HStack {
                TextField("Add ingredient", text: $newIngredient)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    if !newIngredient.isEmpty {
                        ingredients.append(newIngredient)
                        newIngredient = ""
                    }
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                }
            }
            
            List(ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
            
            Button(action: {
                generateRecipe()
            }) {
                Text("Create my recipe")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(30)
            }
            
            // Display the generated recipe
            if let recipe = viewModel.generatedRecipe {
                Text("Recommended Recipe: \(recipe)")
                    .font(.headline)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
    
    func generateRecipe() {
        // Combine selected cuisine and ingredients to send to the backend
        guard let cuisine = selectedCuisine else {
            viewModel.generatedRecipe = "Please select a cuisine."
            return
        }
        
        let ingredientsString = ingredients.joined(separator: ", ")
        
        // Call the view model's generateRecipe method to request the recipe
        viewModel.generateRecipe(preferences: "\(cuisine), \(ingredientsString)")
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
