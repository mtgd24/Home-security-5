import SwiftUI

struct DevicesView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Add Device Button
                Button(action: {
                    // Action to add a device (to be implemented)
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Device")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
                .padding(.horizontal)

                // Device Status Cards
                VStack(spacing: 16) {
                    DeviceStatusBox(title: "Camera", status: "Online", color: .green)
                    DeviceStatusBox(title: "Motion Sensor", status: "Active", color: .orange)
                    DeviceStatusBox(title: "Alarm", status: "Off", color: .red)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)
            .navigationTitle("Devices")
        }
    }
}

// Reusable status box component
struct DeviceStatusBox: View {
    var title: String
    var status: String
    var color: Color

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text("Status: \(status)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Circle()
                .fill(color)
                .frame(width: 16, height: 16)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
    }
}
