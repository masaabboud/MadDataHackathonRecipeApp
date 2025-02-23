//
//  NavBar.swift
//  RecipeApp
//
//  Created by Annie Z on 2/22/25.
//

import Foundation
import UIKit
import SwiftUI

struct NavBar: View {
    @State private var selectedTab = 1
    var body: some View {
        NavigationView{
            TabView(selection:$selectedTab){
                HomeView()
                    .tabItem{
                        Image(systemName:"house.fill")
                        Text("Home")
                    }
                    .tag(1)
                RecipeView()
                    .tabItem{
                        Image(systemName: "slider.horizontal.3")
                        Text("Create")
                    }
                    .tag(2)
                ProfileView()
                    .tabItem{
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(3)
            }
            .onAppear{
                selectedTab = 1
            
            }
        }
    }
}
