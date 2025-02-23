import SwiftUI

struct HomeView: View {
    let latestRecipes = [
        Recipe(name: "Special Burger", ingredients: ["Bun", "Lettuce", "Tomato", "Patty", "Cheese"], directions: ["Toast bun", "Cook patty", "Assemble ingredients", "Serve"]),
        Recipe(name: "Pasta Primavera", ingredients: ["Pasta", "Tomatoes", "Garlic", "Basil", "Olive Oil"], directions: ["Boil pasta", "Sauté tomatoes and garlic", "Mix everything together", "Garnish with basil"]),
        Recipe(name: "Avocado Toast", ingredients: ["Bread", "Avocado", "Lemon", "Salt", "Pepper"], directions: ["Toast bread", "Mash avocado", "Spread on toast", "Season to taste"]),
        Recipe(name: "Healthy Salad", ingredients: ["Lettuce", "Tomato", "Cucumber", "Olives", "Feta Cheese"], directions: ["Chop ingredients", "Mix in a bowl", "Add dressing", "Serve"])
    ]
    let recipeOfTheWeek = Recipe(name: "Farro Salad", ingredients: ["Lettuce", "Tomato", "Cucumber", "Olives", "Feta Cheese"], directions: ["Chop ingredients", "Mix in a bowl", "Add dressing", "Serve"])
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 25) {
                Spacer()
                Text("hungry?")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                
                NavigationLink(destination: RecipeView()) {
                    Text("Create Recipe")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0))
                        .cornerRadius(20)
                        .foregroundColor(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1)
                        )
                }
                
                
                Text("latest recipes")
                    .font(.title3)
                    .padding(.top, 10)
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        ForEach(latestRecipes) { recipe in
                            RecipeComponent(recipe: recipe)
                        }
                    }
                }
                .padding()
                
                Text("recipe of the week")
                    .font(.title3)
                    .padding(.top, 10)
                RecipeComponentFull(recipe: recipeOfTheWeek)
                    .padding(.bottom, 10)
                
            }
            .padding()
        }
    }
}
