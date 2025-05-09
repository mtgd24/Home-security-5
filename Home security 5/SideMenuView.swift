import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                    .overlay(Image(systemName: "person.fill"))
                VStack(alignment: .leading) {
                    Text("陳小明")
                    Text("chen@example.com")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding()

            Divider()

            MenuItem(icon: "house.fill", text: "首頁")
            MenuItem(icon: "chart.bar.fill", text: "數據中心")
            MenuItem(icon: "gear", text: "設備管理")
            MenuItem(icon: "bell.fill", text: "消息通知")
            MenuItem(icon: "person.fill", text: "個人設置")

            Spacer()

            Button(action: {
                // Logout action
            }) {
                HStack {
                    Image(systemName: "arrow.uturn.left")
                    Text("登出")
                }
                .foregroundColor(.red)
                .padding()
            }
        }
        .frame(maxWidth: 250)
        .background(Color(.systemGray6))
    }
}

struct MenuItem: View {
    let icon: String
    let text: String

    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(text)
        }
        .padding(.horizontal)
    }
}
