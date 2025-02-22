import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    
    var body: some View {
        TabView(selection: $currentPage) {
            WelcomeView(currentPage: $currentPage).tag(0)
            SignUpView(currentPage: $currentPage).tag(1)
            GoalsView(currentPage: $currentPage).tag(2)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

