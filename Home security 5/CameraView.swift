import SwiftUI

struct CameraView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 200)
                    .overlay(Text("Live Camera Feed")
                        .foregroundColor(.white))

                Text("History")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)

                List {
                    Text("Motion detected at 10:23 AM")
                    Text("Motion detected at 9:45 AM")
                    Text("Camera recorded at 8:30 AM")
                }
                .listStyle(PlainListStyle())

                Spacer()
            }
            .padding()
            .navigationTitle("Camera")
        }
    }
}
