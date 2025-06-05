import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DevicesView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Devices")
                }

            CameraView()
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("Camera")
                }

            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
        .accentColor(.blue)
    }
}
