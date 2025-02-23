//
//  ProfileView.swift
//  RecipeApp
//
//  Created by Annie Z on 2/22/25.
//

import Foundation
import SwiftUI

var pastRecipes = ["Pasta", "Pizza", "Salad", "Fried Rice", "Cheeseburger", "Sushi", "Dumplings", "Curry Chicken"]

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20){

                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        HStack(alignment: .top, spacing:0){
                            Text("Hello,")
                            Text(" Jane Doe")
                                .foregroundColor(.orange)
                        }
                        .font(.title)
                        .bold()
                        .padding(.top)
                        .padding(.leading, 20)
                        
                        Spacer()
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .foregroundColor(.orange)
                            .frame(width: 80, height: 80)
                            .padding(.trailing, 30)
                    }
                    
                    
                    
                    //past recipes
                    VStack(alignment: .leading){
                        Text("Your recipes:")
                            .font(.title3)
                            .padding(.bottom, 5)
                        
                        List(pastRecipes, id: \.self){ recipe in
                            Text(recipe)
                                .font(.headline)
                                .padding()
                                .cornerRadius(10)
                                .padding(.vertical, 5)
                        }
                        .frame(minHeight: 250)
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
