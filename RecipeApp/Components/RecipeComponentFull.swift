import SwiftUI

struct RecipeComponentFull: View {
    let recipe: Recipe
    let image = "plate"

    var body: some View {
        NavigationLink(destination: RecipeCardView(recipe: recipe)) {
            VStack(spacing: 12) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top, 16)

                Text(recipe.name)
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: 150)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(radius: 4))
            .padding()
        }
        .buttonStyle(PlainButtonStyle())
    }
}

