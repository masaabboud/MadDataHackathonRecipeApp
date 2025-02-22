
import SwiftUI

struct GoalsView: View {
    @Binding var currentPage: Int
    @AppStorage("isOnboardingShowing") var isOnboardingShowing = true

    var body: some View {
        VStack {
            Text("goals!")
            
            Button(action: {
                isOnboardingShowing = false
            }) {
                Text("Done")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(30)
            }
        }
        .padding()
    }
}
