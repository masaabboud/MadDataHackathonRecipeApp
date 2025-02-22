
import SwiftUI

struct SignUpView: View {
    @Binding var currentPage: Int
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""

    var body: some View {
        VStack() {
            Spacer()

            ZStack(alignment: .top) {
                VStack{
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: UIScreen.main.bounds.height * 0.75)
                        .edgesIgnoringSafeArea(.bottom)
                }
                
                
                VStack(alignment: .center, spacing: 20) {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 40)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name")
                            .font(.subheadline)
                        TextField("", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 10)
                        
                        Text("Email")
                            .font(.subheadline)
                        TextField("", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 10)

                        Text("Password")
                            .font(.subheadline)
                        SecureField("", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    Button(action: {
                        withAnimation {
                            currentPage += 1
                        }
                    }) {
                        Text("Next")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(30)
                    }
                    .padding(.top, 10)

                    // Sign-in Link
                    Text("Already have an account? Sign in")
                        .font(.footnote)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(width: 300) 
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        StateWrapper()
    }
}

struct StateWrapper: View {
    @State private var currentPage = 0
    var body: some View {
        SignUpView(currentPage: $currentPage)
    }
}

