import SwiftUI

struct DietaryPreferenceView: View {
    @Binding var currentPage: Int
    @State private var selectedPreference: String? = nil

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("do you have any\ndietary preferences?")
                .font(.system(size: 30, weight: .bold))
                .multilineTextAlignment(.leading)
            
            HStack(spacing: 10) {
                PreferenceButton(title: "Vegetarian", selected: $selectedPreference)
                PreferenceButton(title: "Vegan", selected: $selectedPreference)
            }
            
            PreferenceButton(title: "none", selected: $selectedPreference)
            
        
            
            Button(action: {
                withAnimation {
                    currentPage += 1
                }
            }) {
                Text("set preferences")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(30)
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }
}

struct PreferenceButton: View {
    let title: String
    @Binding var selected: String?

    var body: some View {
        Button(action: {
            selected = (selected == title) ? nil : title
        }) {
            Text(title)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(selected == title ? Color.gray.opacity(0.3) : Color.clear)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                )
        }
        .foregroundColor(.black)
    }
}

struct DietaryPreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        DietaryPreferenceView(currentPage: .constant(1))
    }
}
