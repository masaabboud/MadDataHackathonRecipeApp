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
                    let preferences = (selectedCuisine ?? "") + ", " + ingredients.joined(separator: ", ")
                    userPrompt = preferences  // Store the user's prompt
                    viewModel.generateRecipe(preferences: preferences)
                }) {
                    Text("Create My Recipe")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
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
}
