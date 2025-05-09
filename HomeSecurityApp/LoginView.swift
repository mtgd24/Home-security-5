import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack {
            Spacer()

            Text("欢迎登录")
                .font(.title)
                .bold()
            Text("智慧家庭安防管理系统")
                .foregroundColor(.gray)
                .padding(.bottom)

            TextField("请输入用户名", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            SecureField("请输入密码", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            HStack {
                Spacer()
                Button("立即注册") {}.font(.footnote).padding(.trailing)
            }

            Button("登录") {
                isLoggedIn = true
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)

            HStack(spacing: 20) {
                Image(systemName: "touchid")
                Image(systemName: "faceid")
            }
            .padding(.top)

            Spacer()
        }
    }
}
