//
//  TestResultView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI

struct TestResultView: View {
    @ObservedObject var viewModel: QuestionViewModel
    @StateObject private var testResultViewModel = TestResultViewModel()
    @State var navigateToNext = false
    var body: some View {
        VStack{
            ChartView()
            
            Divider()
            
            Text("Summary")
            Text(testResultViewModel.summaryResult())
                .font(.system(size: 25))
                .bold()
            
            Divider()
            Text("Social Test Results")
                .font(.headline)
                .padding(.top)
            
            Text("The items you responded 'yes' to: \(testResultViewModel.socialTestResults.count)")
            ForEach(testResultViewModel.socialTestResults, id: \.self) { result in
                Text("\(result.description)")
            }
            
            Divider()
            
            Text("Behavior Test Results ")
                .font(.headline)
                .padding(.top)
            
            Text("The items you responded 'yes' to: \(testResultViewModel.behaviorTestResults.count)")
            ForEach(testResultViewModel.behaviorTestResults, id: \.self) { result in
                Text("\(result.description)")
            }
            
            NavigationLink(destination: HomeView(), isActive: $navigateToNext) {
                AnswerButton(title: "Go To Home") {
                    navigateToNext = true
                }
            }
        }
        .onAppear {
            testResultViewModel.getUserAnswer(viewModel: viewModel)
        }
    }
    
}

#Preview {
    TestResultView(viewModel: QuestionViewModel())
}
