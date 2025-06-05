import SwiftUI

struct AddDeviceView: View {
    @Environment(\.dismiss) var dismiss
    var onSelect: (DeviceType) -> Void

    var body: some View {
        NavigationView {
            List(DeviceType.allCases) { deviceType in
                Button(action: {
                    onSelect(deviceType)
                    dismiss()
                }) {
                    Text(deviceType.rawValue)
                        .font(.headline)
                        .padding()
                }
            }
            .navigationTitle("Select Device Type")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
