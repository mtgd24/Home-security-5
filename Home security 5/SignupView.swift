import SwiftUI

struct SignupView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Create Account")
                    .font(.largeTitle)
                    .bold()
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Email")
                        .font(.headline)
                    TextField("Enter your email", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Text("Password")
                        .font(.headline)
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Text("Confirm Password")
                        .font(.headline)
                    SecureField("Re-enter your password", text: $confirmPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                
                Button(action: {
                    if validateInputs() {
                        authVM.signup(email: email, password: password)
                    }
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                
                Button(action: {
                    authVM.showSignup = false
                }) {
                    Text("Already have an account? Log In")
                        .foregroundColor(.blue)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Sign Up")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func validateInputs() -> Bool {
        guard isValidEmail(email) else {
            alertMessage = "Please enter a valid email address."
            showAlert = true
            return false
        }
        guard !password.isEmpty else {
            alertMessage = "Password cannot be empty."
            showAlert = true
            return false
        }
        guard password == confirmPassword else {
            alertMessage = "Passwords do not match."
            showAlert = true
            return false
        }
        return true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
}
