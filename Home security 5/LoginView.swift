import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Welcome Back")
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
                }
                
                Button(action: {
                    if isValidEmail(email) && !password.isEmpty {
                        if !authVM.login(email: email, password: password) {
                            alertMessage = "Invalid email or password."
                            showAlert = true
                        }
                    } else {
                        alertMessage = "Please enter a valid email and password."
                        showAlert = true
                    }
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                
                Button(action: {
                    authVM.showSignup = true
                }) {
                    Text("Don't have an account? Sign Up")
                        .foregroundColor(.blue)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Login")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
}
