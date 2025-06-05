import SwiftUI

struct MainView: View {
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        TabView {
            
            DevicesView()
                .tabItem {
                    Label("Devices", systemImage: "house.fill")
                }

            CameraView()
                .tabItem {
                    Label("Camera", systemImage: "video.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .accentColor(.blue)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                authVM.logout()
            }) {
                Image(systemName: "power")
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}
