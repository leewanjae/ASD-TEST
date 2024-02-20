import SwiftUI

struct ContentView: View {
    @State private var navigateToNext = false // 화면 전환을 위한 상태 변수
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Image("logo")
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            .navigationDestination(isPresented: $navigateToNext) {
                HomeView()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.navigateToNext = true
                }
            }
        }
    }
}
