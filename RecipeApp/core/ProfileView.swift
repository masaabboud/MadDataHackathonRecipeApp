//
//  ProfileView.swift
//  RecipeApp
//
//  Created by Annie Z on 2/22/25.
//

import Foundation
import SwiftUI

var pastRecipes = [
    Recipe(name: "Tofu Stir Fry", ingredients: ["Tofu", "Bell Peppers", "Pineapple", "Soy Sauce", "Vinegar", "Brown Sugar", "Garlic", "Ginger"], directions: ["Sauté vegetables in a pot", "Add lentils and broth and herbs", "Bring to a boil, then simmer", "Season and serve warm"]),
    Recipe(name: "Special Burger", ingredients: ["Bun", "Lettuce", "Tomato", "Patty", "Cheese"], directions: ["Toast bun", "Cook patty", "Assemble ingredients", "Serve"]),
    Recipe(name: "Pasta Primavera", ingredients: ["Pasta", "Tomatoes", "Garlic", "Basil", "Olive Oil"], directions: ["Boil pasta", "Sauté tomatoes and garlic", "Mix everything together", "Garnish with basil"]),
    Recipe(name: "Avocado Toast", ingredients: ["Bread", "Avocado", "Lemon", "Salt", "Pepper"], directions: ["Toast bread", "Mash avocado", "Spread on toast", "Season to taste"]),
    Recipe(name: "Healthy Salad", ingredients: ["Lettuce", "Tomato", "Cucumber", "Olives", "Feta Cheese"], directions: ["Chop ingredients", "Mix in a bowl", "Add dressing", "Serve"]),
    Recipe(name: "Chicken Noodle Soup", ingredients: ["Chicken", "Celery", "Noodles", "Carrots", "Chicken Broth"], directions: ["Sauté carrots and celery", "Add chicken and broth, bring to boil", "Sitr in noodles", "Season and serve"]),
]

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20){

                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        HStack(alignment: .top, spacing:0){
                            Text("Hello,")
                            Text(" Jane Doe")
                                .foregroundColor(Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0))
                        }
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .padding(.leading, 20)
                        
                        Spacer()
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0))
                            .frame(width: 80, height: 80)
                            .padding(.trailing, 30)
                    }
                    
                    
                    
                    //past recipes
                    VStack(alignment: .leading){
                        Text("Your recipes:")
                            .font(.title3)
                            .padding(.bottom, 5)
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            LazyVGrid(columns: [ GridItem(.flexible(), spacing: 5),
                                GridItem(.flexible(), spacing: 5)], spacing: 1)
                                                 {
                                ForEach(pastRecipes) { recipe in
                                    RecipeComponent(recipe: recipe)
                                    
                                }
                            }
                            .padding(.horizontal, 5)
                        }

                        Spacer()
                    }
                    .padding()
            }
            
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
