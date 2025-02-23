import SwiftUI

struct RecipeView: View {
    @State private var selectedCuisine: String? = nil
    @State private var ingredients: [String] = []
    @State private var newIngredient: String = ""
    @State private var recipe: Recipe? = nil
    @State private var navigateToRecipe = false

    var cuisines = ["Mexican", "Italian", "Indian", "Chinese"]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("What type of cuisine do you want?")
                    .font(.title)
                    .bold()
                
                HStack {
                    ForEach(cuisines, id: \.self) { cuisine in
                        Button(action: {
                            selectedCuisine = cuisine
                        }) {
                            Text(cuisine)
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
                    createRecipe()
                    navigateToRecipe = true
                }) {
                    Text("create my recipe")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(30)
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $navigateToRecipe) {
                if let recipe = recipe {
                    RecipeCardView(recipe: recipe)
                }
            }
        }
    }
    
    func createRecipe() {
        recipe = Recipe(
            name: "Custom Recipe",
            ingredients: ingredients.isEmpty ? ["Ingredient 1", "Ingredient 2"] : ingredients,
            directions: ["Step 1: Prep ingredients", "Step 2: Cook", "Step 3: Serve"],
            nutritionInfo: "Calories: 500 kcal"
        )
    }
}

struct Recipe {
    let name: String
    let ingredients: [String]
    let directions: [String]
    let nutritionInfo: String
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}

