import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("hungry?")
                    .font(.largeTitle)
                    .bold()
                
                NavigationLink(destination: RecipeView()) {
                    Text("Create Recipe")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1)
                        )
                }
                
                Text("latest recipes")
                    .font(.headline)
                    .padding(.top, 10)
                
                HStack(spacing: 15) {
                    RecipeBoxView(recipeName: "Recipe 1")
                    RecipeBoxView(recipeName: "Recipe 2")
                }
                
                Spacer()
            }
            .padding()
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

