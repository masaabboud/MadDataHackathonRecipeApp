import SwiftUI

struct WelcomeView: View {
    @Binding var currentPage: Int
    var body: some View{
        VStack{
            Spacer()
            Text("quickbite")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0))
            Text("welcome to your personal chef")
                .font(.system(size:16))
            Spacer()
            
            Button(action: {
                withAnimation {
                    currentPage += 1
                }
            }) {
                Text("get started")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0x00 / 255.0, green: 0x46 / 255.0, blue: 0x18 / 255.0))
                    .cornerRadius(30)
            }
        }
        .padding()
    }
}

