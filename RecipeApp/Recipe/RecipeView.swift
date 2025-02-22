//
//  RecipeView.swift
//  Recipe App
//
//  Created by Annie Z on 2/22/25.
//

import SwiftUI
struct RecipeView: View{
    @State var showResult: Bool = false
    var body: some View{
        VStack {
            Text("Here is the information you entered:")
            Button(action: {
                runPythonCode(preferences: <#T##[String : Any]#>, )
                showResult.toggle()
            }) {
                Text("Generate a unique recipe!")
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            if showResult{
                Text(String("\(runPythonCode(preferences: <#T##[String : Any]#>))"))
            }
            
        }
        .padding()
        
        //button for generating recipe
    
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
