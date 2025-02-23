import SwiftUI

struct AllergyPreferenceView: View {
    @Binding var currentPage: Int
    @State private var selectedAllergies: Set<String> = []
    @AppStorage("isOnboardingShowing") private var isOnboardingShowing = true

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            Text("Do you have any\nallergies?")
                .font(.system(size: 30, weight: .bold))
                .multilineTextAlignment(.leading)
            
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    AllergyButton(title: "Dairy", selectedItems: $selectedAllergies)
                    AllergyButton(title: "Gluten", selectedItems: $selectedAllergies)
                }
                AllergyButton(title: "Soy", selectedItems: $selectedAllergies)
            }

            Spacer()
            
            Button(action: {
                isOnboardingShowing = false
                print("Allergies set to: \(selectedAllergies.joined(separator: ", "))")
            }) {
                Text("set preferences")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0))
                    .cornerRadius(30)
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }
}

// Reusable Button for Multi-Selection Preferences
struct AllergyButton: View {
    let title: String
    @Binding var selectedItems: Set<String>

    var body: some View {
        Button(action: {
            if selectedItems.contains(title) {
                selectedItems.remove(title)  // Deselect if already selected
            } else {
                selectedItems.insert(title)  // Select if not selected
            }
        }) {
            Text(title)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(selectedItems.contains(title) ? Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0).opacity(0.3) : Color.clear)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                )
        }
        .foregroundColor(.black)
    }
}

