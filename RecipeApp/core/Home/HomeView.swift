import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("hungry?")
                    .font(.largeTitle)
                    .bold()
                
                Button(action: {
                    // Navigate to CreateRecipeView
                }) {
                    NavigationLink(destination: CreateRecipeView()) {
                        Text("make a recipe")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                }
                .padding(.vertical)
                
                Text("latest recipes")
                    .font(.headline)
                
                HStack {
                    NavigationLink(destination: RecipeDetailView(recipe: "Recipe 1")) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 150, height: 100)
                    }
                    NavigationLink(destination: RecipeDetailView(recipe: "Recipe 2")) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 150, height: 100)
                    }
                }
                .padding(.vertical)
                
                Text("recipe of the week")
                    .font(.headline)
                
                NavigationLink(destination: RecipeDetailView(recipe: "Featured Recipe")) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 100)
                }
                .padding(.vertical)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct RecipeDetailView: View {
    let recipe: String
    
    var body: some View {
        Text(recipe)
            .font(.largeTitle)
            .bold()
            .padding()
    }
}

struct CreateRecipeView: View {
    var body: some View {
        Text("Create a new recipe")
            .font(.largeTitle)
            .bold()
            .padding()
    }
}

