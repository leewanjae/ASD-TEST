//
//  BehaviorQuestionView.swift
//
//
//  Created by 이완재 on 2/4/24.
//

import SwiftUI

struct BehaviorQuestionView: View {
    @EnvironmentObject var userInfo: UserInfo
    @ObservedObject var viewModel: QuestionViewModel
//    @State private var showAlter = false
    @State private var navigateToNext = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Name: \(userInfo.name)")
                        .padding(.trailing, 50)
                    Text("Age(Year): \(userInfo.age)")
                }
                
                ProgressView(value: viewModel.progress, total: 1.0)
                    .progressViewStyle(.linear)
                    .frame(height: 20)
                    .padding()
                
                Spacer()
                
                if let socialTestItem = viewModel.currentBehaviorTestItem {
                    Text(socialTestItem.description)
                    HStack {
                        Button("Yes") {
                            viewModel.userRespondedToBehaviorTest(response: .yes)
                        }
                        
                        Button("No") {
                            viewModel.userRespondedToBehaviorTest(response: .no)
                        }
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: TestResultView(), isActive: $navigateToNext) {
                    ProgressButton(title: "Submit", progressAction: {
                            navigateToNext = true
                    }, disabled: viewModel.hasAnsweredAllBehaviorQuestions)
                }
            }
            .onChange(of: viewModel.progress, perform: { newValue in
                if newValue >= 1.0 {
                }
            })
        }
        .onAppear{
            viewModel.updateProgress()
        }
    }
}

#Preview {
    BehaviorChartView()
}
