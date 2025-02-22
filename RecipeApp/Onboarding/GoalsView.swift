
import SwiftUI

struct GoalsView: View {
    @Binding var currentPage: Int

    var body: some View {
        VStack(alignment: .center) {
            
            Text("Do you have any Dietary Preferences?")
            
            Button(action: {
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
