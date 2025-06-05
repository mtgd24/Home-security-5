import SwiftUI

struct DevicesView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Button(action: {
                    // Action to add device
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
                }

                VStack(alignment: .leading, spacing: 10) {
                    DeviceStatusBox(title: "Camera", status: "Online")
                    DeviceStatusBox(title: "Motion Sensor", status: "Active")
                    DeviceStatusBox(title: "Alarm", status: "Off")
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Devices")
        }
    }
}

struct DeviceStatusBox: View {
    var title: String
    var status: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text("Status: \(status)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
