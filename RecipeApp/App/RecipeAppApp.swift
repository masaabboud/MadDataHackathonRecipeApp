//
//  Recipe_AppApp.swift
//  Recipe App
//
//  Created by Masa Abboud on 2/22/25.
//

import SwiftUI


@main
struct Recipe_AppApp: App {
    @AppStorage("isOnboardingShowing") private var isOnboardingShowing = true
    var body: some Scene {
        WindowGroup {
            if isOnboardingShowing {
                OnboardingView()
            } else {
                HomeView()
                
            }
        }
    }
}
