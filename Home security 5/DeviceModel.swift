import Foundation

enum DeviceType: String, CaseIterable, Identifiable {
    case camera = "Camera"
    case motionSensor = "Motion Sensor"
    case alarm = "Alarm"

    var id: String { self.rawValue }
}

struct Device: Identifiable, Equatable {
    let id: UUID = UUID()
    let type: DeviceType
    var status: String

    // Optional if Swift auto-synthesis doesn't work
    static func == (lhs: Device, rhs: Device) -> Bool {
        return lhs.id == rhs.id &&
               lhs.type == rhs.type &&
               lhs.status == rhs.status
    }
}
