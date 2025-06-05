import SwiftUI

struct DevicesView: View {
    @State private var devices: [Device] = [
        Device(type: .camera, status: "Online"),
        Device(type: .motionSensor, status: "Active"),
        Device(type: .alarm, status: "Off")
    ]
    
    @State private var showAddDevice = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                Button(action: {
                    showAddDevice = true
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
                
                List {
                    ForEach(devices) { device in
                        DeviceStatusBox(title: device.type.rawValue, status: device.status)
                    }
                    .onDelete(perform: deleteDevice)
                }
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .padding()
            .navigationTitle("Devices")
            .sheet(isPresented: $showAddDevice) {
                AddDeviceView { selectedDeviceType in
                    addDevice(of: selectedDeviceType)
                    showAddDevice = false
                }
            }
        }
    }
    
    // Add new device
    private func addDevice(of type: DeviceType) {
        // Optional: prevent duplicates
        guard !devices.contains(where: { $0.type == type }) else { return }
        let newDevice = Device(type: type, status: "Unknown")
        devices.append(newDevice)
    }
    
    // Delete device
    private func deleteDevice(at offsets: IndexSet) {
        devices.remove(atOffsets: offsets)
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
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
