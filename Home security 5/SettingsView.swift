import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Account")) {
                    Text("Email: user@example.com")
                    Button("Log Out") {
                        // Logout action
                    }
                    .foregroundColor(.red)
                }

                Section(header: Text("App Settings")) {
                    Toggle("Notifications", isOn: .constant(true))
                    Toggle("Dark Mode", isOn: .constant(false))
                }
            }
            .navigationTitle("Settings")
        }
    }
}
