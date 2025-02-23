import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Divider()
                
                Text("Ingredients:")
                    .font(.headline)
                VStack(alignment: .leading) {
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("\(ingredient)")
                            .font(.body)
                    }
                }
                
                Divider()
                
                Text("Directions:")
                    .font(.headline)
                VStack(alignment: .leading) {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        Text("\(index + 1). \(recipe.directions[index])")
                            .font(.body)
                    }
                }
                
                Divider()
                
                Text("Nutrition Info:")
                    .font(.headline)
                Text(recipe.nutritionInfo)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: Recipe(
            name: "Pasta Primavera",
            ingredients: ["Pasta", "Tomatoes", "Garlic", "Basil", "Olive Oil"],
            directions: ["Boil pasta", "Sauté tomatoes and garlic", "Mix everything together", "Garnish with basil"],
            nutritionInfo: "Calories: 500 kcal per serving"
        ))
        .background(Color.white.opacity(0.5))
    }
}
