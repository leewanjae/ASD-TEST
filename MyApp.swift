import SwiftUI

@main
struct MyApp: App {
    @StateObject private var userInfo = UserInfo()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userInfo)
        }
    }
}
