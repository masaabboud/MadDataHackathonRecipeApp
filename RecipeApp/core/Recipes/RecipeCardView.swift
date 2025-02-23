import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe
    let preferences: String? = nil

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                Text("Your Prompt:")
                    .font(.headline)
                    .foregroundColor(.gray)
                Text(preferences ?? "")
                    .font(.body)
                    .italic()
                    .padding(.bottom, 10)
                
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
                
            }
            .padding()
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

