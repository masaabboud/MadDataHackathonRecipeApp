import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    
    var body: some View {
        TabView(selection: $currentPage) {
            WelcomeView(currentPage: $currentPage).tag(0)
            LoginView(currentPage: $currentPage).tag(1)
            DietaryPreferenceView(currentPage: $currentPage).tag(2)
            AllergyPreferenceView(currentPage: $currentPage).tag(3)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

