import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe
    @State private var currentTab: Int = 0
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView {
                Spacer()
                VStack(alignment: .center, spacing: 10) {
                    Text(recipe.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(20)
                    
                    Divider()
                    
            
                    HStack(spacing: -30){
                        Button(action: {
                            withAnimation{
                                currentTab = 0
                            }
                        }) {
                            Text("Ingredients")
                                .padding(20)
                                .fontWeight(.bold)
                                .frame(width: 220, height:50)
                                .background(currentTab == 0 ? Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0) : Color.white)
                                .clipShape(Capsule())
                                .foregroundColor(currentTab == 0 ? Color.white : Color.black)
                                .padding(.leading, 30)
    

                            
                        }
                        Button(action: {
                            withAnimation{
                                currentTab = 1
                            }
                        }) {
                            Text("Directions")
                                .padding(20)
                                .fontWeight(.bold)
                                .frame(width: 220, height:50)
                                .background(currentTab == 1 ? Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0) : Color.white)
                                .clipShape(Capsule())
                                .foregroundColor(currentTab == 1 ? Color.white : Color.black)
                                .frame(width: 200, height: 30)
                                .padding(.trailing, 30)


                            
                        }

                    }
                    .padding(20)
                    if currentTab == 0{
                        VStack(alignment: .leading, spacing: 10){
                            ForEach(recipe.ingredients, id: \.self) { ingredient in
                                Text("\(ingredient)")
                                    .font(.body)
                                    
                            }
                        }
                        .padding(20)
                    } else {
                        
                        VStack(alignment: .leading, spacing: 10){

                                ForEach(recipe.directions.indices, id: \.self) { index in
                                    Text("\(index + 1). \(recipe.directions[index])")
                                        .font(.body)
                                }
                    }
                        .padding(20)
                    
                
                    }
                    
                }
                .padding()
            }
            .background(Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0).opacity(0.2))
            .cornerRadius(100)
            .frame(width: geometry.size.width, height: geometry.size.height * 1.2)
            .padding(.top, 15)
            .padding(.bottom, -30)
        }
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: Recipe(name: "Tofu Stir Fry", ingredients: ["Tofu", "Bell Peppers", "Pineapple", "Soy Sauce", "Vinegar", "Brown Sugar", "Garlic", "Ginger"], directions: ["Sauté vegetables in a pot", "Add lentils and broth and herbs", "Bring to a boil, then simmer", "Season and serve warm"]))
    }
}
