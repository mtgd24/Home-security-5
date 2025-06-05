import SwiftUI

struct ContentView: View {
    @StateObject private var authVM = AuthViewModel()
    
    var body: some View {
        Group {
            if authVM.isLoggedIn {
                MainView()
                    .environmentObject(authVM)
            } else {
                if authVM.showSignup {
                    SignupView()
                        .environmentObject(authVM)
                } else {
                    LoginView()
                        .environmentObject(authVM)
                }
            }
        }
    }
}
