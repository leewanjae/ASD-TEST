//
//  TestResultView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI

struct TestResultView: View {
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @StateObject private var testResultViewModel = TestResultViewModel()
    @State var navigateToNext = false

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
                
                Text(testResultViewModel.summaryResult())
                    .padding(.vertical, 30)
                    .font(.headline)
                
                    SeverityView()

                NavigationLink(destination: HomeView(), isActive: $navigateToNext) {
                    AnswerButton(title: "Go To Home") {
                        navigateToNext = true
                    }
                }
            }
            .onAppear {
                testResultViewModel.loadResultsFromUserDefaults()
                testResultViewModel.getUserAnswer(viewModel: questionViewModel)
            }
        }
    }
}

#Preview {
    TestResultView()
        .environmentObject(QuestionViewModel())
}
