import SwiftUI

struct RecipeView: View {
    @StateObject private var viewModel = RecipeViewModel()
    @State private var selectedCuisine: String? = nil
    @State private var ingredients: [String] = []
    @State private var newIngredient: String = ""
    @State private var navigateToRecipe = false
    @State private var userPrompt: String = ""  // Store the prompt

    let cuisines = ["Mexican", "Italian", "Indian", "Chinese"]

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
                                .background(selectedCuisine == cuisine ? Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0) : Color.clear)
                                .foregroundColor(selectedCuisine == cuisine ? Color.white : Color.black)
                                .cornerRadius(50)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.black, lineWidth: 1))
                        }
                    }
                }

                
                Spacer()
                
                Text("What ingredients do you have?")
                    .font(.title2)
                    .bold()
                
                Spacer()
                

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
                            .foregroundColor(Color.black)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                    }
                }

                List(ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
                .background(Color.white)
                .listRowBackground(Color.white)
                .scrollContentBackground(.hidden)
                

                Button(action: {
                    let preferences = (selectedCuisine ?? "") + ", " + ingredients.joined(separator: ", ")
                    userPrompt = preferences  // Store the user's prompt
                    viewModel.generateRecipe(preferences: preferences)
                }) {
                    Text("Create My Recipe")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0))
                        .cornerRadius(30)
                }
                .padding(.top, 10)

                if let generatedRecipe = viewModel.generatedRecipe {
                    NavigationLink(
                        destination: RecipeCardView(recipe: generatedRecipe, preferences: userPrompt),
                        isActive: $navigateToRecipe
                    ) {
                        EmptyView()
                    }
                    .hidden()
                    .onAppear {
                        navigateToRecipe = true
                    }
                }

                Spacer()
            }
            .padding()
        }
    }
    
    func createRecipe() {
        recipe = Recipe(
            name: "Custom Recipe",
            ingredients: ingredients.isEmpty ? ["Ingredient 1", "Ingredient 2"] : ingredients,
            directions: ["Step 1: Prep ingredients", "Step 2: Cook", "Step 3: Serve"]
        )
    }
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let ingredients: [String]
    let directions: [String]

}
