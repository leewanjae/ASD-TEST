import SwiftUI

@main
struct MyApp: App {
    @StateObject private var userInfo = UserInfo()
    @StateObject private var questionViewModel = QuestionViewModel()
    @StateObject private var testResultViewModel = TestResultViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userInfo)
                .environmentObject(questionViewModel)
                .environmentObject(testResultViewModel)
        }
    }
}
