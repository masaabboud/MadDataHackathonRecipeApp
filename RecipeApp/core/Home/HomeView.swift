import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = RecipeViewModel() // ViewModel to manage recipe data
    @State private var showRecipeView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("hungry?")
                    .font(.largeTitle)
                    .bold()

                Button(action: {
                    // Trigger the recipe generation and navigation
                    viewModel.generateRecipe(preferences: "vegetarian")  // Example preference, you can modify this logic as needed
                    showRecipeView = true  // Trigger navigation to RecipeView
                }) {
                    Text("make a recipe")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                .padding(.vertical)

                // Latest recipes section
                Text("latest recipes")
                    .font(.headline)
                    .padding(.top, 10)

                ScrollView(.horizontal) {
                    HStack {
                        // Dynamically display the latest recipes from the ViewModel
                        ForEach(viewModel.recipes, id: \.name) { recipe in
                            RecipeBoxView(recipeName: recipe.name)
                        }
                    }
                }
                .padding(.vertical)

                Spacer()
            }
            .padding()
            .background(
                // Navigation to RecipeView when `showRecipeView` is triggered
                NavigationLink(destination: RecipeView(), isActive: $showRecipeView) {
                    EmptyView()
                }
            )
            .onAppear {
                // Fetch recipes when HomeView appears
                viewModel.fetchRecipes()
            }
        }
    }
}

struct RecipeBoxView: View {
    var recipeName: String
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            Text(recipeName)
                .font(.caption)
                .foregroundColor(.black)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
