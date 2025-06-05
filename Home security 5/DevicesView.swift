import SwiftUI

struct DevicesView: View {
    @State private var devices: [Device] = [
        Device(type: .camera, status: "Active"),
        Device(type: .motionSensor, status: "Idle"),
        Device(type: .alarm, status: "Off")
    ]
    @State private var showingAddDeviceSheet = false

    var body: some View {
        NavigationView {
            List {
                ForEach(devices) { device in
                    VStack(alignment: .leading) {
                        Text(device.type.rawValue)
                            .font(.headline)
                        Text("Status: \(device.status)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 5)
                }
                .onDelete(perform: deleteDevice)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Devices")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddDeviceSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Add Device")
                }
            }
            .sheet(isPresented: $showingAddDeviceSheet) {
                AddDeviceView { newDeviceType in
                    addDevice(type: newDeviceType)
                    showingAddDeviceSheet = false
                }
            }
        }
    }

    func addDevice(type: DeviceType) {
        let newDevice = Device(type: type, status: "New")
        devices.append(newDevice)
    }

    func deleteDevice(at offsets: IndexSet) {
        devices.remove(atOffsets: offsets)
    }
}
