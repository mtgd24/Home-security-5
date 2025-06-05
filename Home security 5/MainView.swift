import SwiftUI

struct MainView: View {
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
        .accentColor(.blue) // Customize the selected tab color
    }
}
