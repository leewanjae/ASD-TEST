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
    @State private var navigateToNext = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Name: \(userInfo.name)")
                        .padding(.trailing, 50)
                    Text("Age(Year): \(userInfo.age)")
                }
                .padding(.vertical, 30)
                
                ProgressView(value: viewModel.progress, total: 1.0)
                    .progressViewStyle(.linear)
                    .frame(height: 20)
                    .padding(.bottom, 50)
                
                Text("B. Restricted, Repetitive Patterns of Behavior, Interests, or Activities")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.bottom, 50)
                
                Spacer()
                
                if let socialTestItem = viewModel.currentBehaviorTestItem {
                    Text(socialTestItem.description)
                        .font(.system(size: 30, weight: .light))
                        .padding(.horizontal, 50)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        AnswerButton(title: "Yes") {
                            viewModel.userRespondedToBehaviorTest(response: .yes)
                        }
                        
                        AnswerButton(title: "No") {
                            viewModel.userRespondedToBehaviorTest(response: .no)
                        }
                        Spacer()
                        
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: TestResultView(viewModel: viewModel), isActive: $navigateToNext) {
                    ProgressButton(title: "Submit", progressAction: {
                        if viewModel.hasAnsweredAllBehaviorQuestions {
                            navigateToNext = true
                        }
                    }, disabled: viewModel.hasAnsweredAllBehaviorQuestions)
                }
            }
        }
    }
}

#Preview {
    BehaviorQuestionView(viewModel: QuestionViewModel())
        .environmentObject(UserInfo())
}
