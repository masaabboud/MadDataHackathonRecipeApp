import SwiftUI

struct RecipeComponent: View {
    let recipe: Recipe
    let image = "plate"

    var body: some View {
        NavigationLink(destination: RecipeCardView(recipe: recipe)) {

            VStack(spacing: 12) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding(.top, 16)

                Text(recipe.name)
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .frame(width: 160, height: 200)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(radius: 4))
            .padding()
        }
        .buttonStyle(PlainButtonStyle()) // Removes default button styling
    }
}

#Preview {
    RecipeComponent(recipe: Recipe(
        name: "Sample Recipe",
        ingredients: ["Ingredient 1", "Ingredient 2"],
        directions: ["Step 1", "Step 2"]
    ))
}
