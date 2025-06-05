import Foundation
import Combine

class AuthViewModel: ObservableObject {
    // Tracks if user is logged in
    @Published var isLoggedIn = false
    
    // Tracks if user wants to see signup screen instead of login
    @Published var showSignup = false
    
    // Simulated user data for demo purpose
    private let demoEmail = "user@example.com"
    private let demoPassword = "password123"
    
    func login(email: String, password: String) -> Bool {
        // Replace with real authentication logic
        if email.lowercased() == demoEmail && password == demoPassword {
            isLoggedIn = true
            return true
        }
        return false
    }
    
    func signup(email: String, password: String) {
        // Replace with real signup logic
        // Here we just log in automatically after signup
        isLoggedIn = true
    }
    
    func logout() {
        isLoggedIn = false
        showSignup = false
    }
}
