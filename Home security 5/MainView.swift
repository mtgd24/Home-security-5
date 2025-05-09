import SwiftUI

struct MainView: View {
    @State private var showMenu = false

    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Text("Main Content Area")
                        .padding()
                }
                .navigationBarTitle("首页", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    withAnimation {
                        showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                })
            }

            if showMenu {
                SideMenuView()
                    .frame(width: 250)
                    .transition(.move(edge: .leading))
                    .zIndex(1)
                    .background(Color.black.opacity(0.3).onTapGesture {
                        withAnimation {
                            showMenu = false
                        }
                    })
            }
        }
    }
}
