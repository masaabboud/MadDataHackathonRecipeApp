import SwiftUI

struct WelcomeView: View {
    @Binding var currentPage: Int
    var body: some View{
        VStack{
            Spacer()
            Text("quickbite")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.orange)
            Text("Welcome to your personal chef")
                .font(.system(size:16))
            Spacer()
            
            Button(action: {
                withAnimation {
                    currentPage += 1
                }
            }) {
                Text("Sign Up")
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

