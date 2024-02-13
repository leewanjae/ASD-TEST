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
    
    var body: some View {
        VStack{
            ChartView()
            
            Text("Social Test Results")
                .font(.headline)
                .padding(.top)
            
            ForEach(testResultViewModel.socialTestResults, id: \.self) { result in
                Text("\(result.description)")
                Text("Yes: \(result.yesCount), No: \(result.noCount)")
            }
            
            Divider()
            
            Text("Behavior Test Results")
                .font(.headline)
                .padding(.top)
            ForEach(testResultViewModel.behaviorTestResults, id: \.self) { result in
                Text("\(result.description)")
                Text("Yes: \(result.yesCount), No: \(result.noCount)")
            }
            
            Divider()
            
            Text("Summary")

        }
        .onAppear {
            testResultViewModel.subscribeToQuestionVM(viewModel: viewModel)
        }
    }
    
}

#Preview {
    TestResultView(viewModel: QuestionViewModel())
}
