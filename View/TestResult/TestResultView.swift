//
//  TestResultView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI

struct TestResultView: View {
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @EnvironmentObject var testResultViewModel: TestResultViewModel
    @EnvironmentObject var userInfo: UserInfo
    
    @State var navigateToNext = false
    var navigationHidden: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                ChartView()
                    .frame(height: 600)

                Divider()
                    .background(Color.main)
                    .padding()
              
                    Text("Summary")
                        .font(.largeTitle)
                        .bold()
                
                Divider()
                    .background(Color.main)
                    .padding()
                
                Spacer()
                
                VStack(alignment: .leading) { // VStack에 .leading 정렬 적용
                    Text("Name: \(UserDefaults.standard.string(forKey: "userName") ?? "Name: ")")
                        .font(.system(size: 30, weight: .semibold))
                    
                    Text("Age: \(userInfo.age)")
                        .font(.system(size: 30, weight: .semibold))
                        .padding(.top, 10)
                }
                .padding() // VStack에 패딩 적용
                .frame(maxWidth: .infinity, alignment: .center) // 프레임의 정렬을 .leading으로 설정
                
                Text(UserDefaults.standard.string(forKey: "TestResultSummary") ?? "")
                    .padding(.vertical, 30)
                    .font(.system(size: 25, weight: .medium))
                
                    SeverityView()

                NavigationLink(destination: HomeView(), isActive: $navigateToNext) {
                    AnswerButton(title: "Go To Home") {
                        navigateToNext = true
                    }
                }
                .navigationBarBackButtonHidden(navigationHidden)
            }
            .onAppear {
                testResultViewModel.getUserAnswer(viewModel: questionViewModel)
            }
        }
    }
}

#Preview {
    TestResultView()
        .environmentObject(QuestionViewModel())
        .environmentObject(TestResultViewModel()) // Preview를 위해 추가
        .environmentObject(UserInfo())
}
