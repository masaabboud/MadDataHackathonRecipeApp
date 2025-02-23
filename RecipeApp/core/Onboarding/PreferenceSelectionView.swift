import SwiftUI

struct PreferenceSelectionView: View {
    let title: String
    let options: [String]
    @Binding var selectedPreference: String?
    let onSubmit: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
            
            // Display options in a grid-like layout
            VStack(spacing: 10) {
                ForEach(options, id: \.self) { option in
                    PreferenceButton(title: option, selected: $selectedPreference)
                }
            }
            
            // Submit Button
            Button(action: {
                onSubmit()
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

// Reusable Button for Preferences
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

