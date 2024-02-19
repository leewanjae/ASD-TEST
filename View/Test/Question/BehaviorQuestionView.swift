//
//  BehaviorQuestionView.swift
//
//
//  Created by 이완재 on 2/4/24.
//

import SwiftUI

struct BehaviorQuestionView: View {
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var questionViewModel: QuestionViewModel
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
                
                ProgressView(value: questionViewModel.progress, total: 1.0)
                    .progressViewStyle(.linear)
                    .frame(height: 20)
                    .padding(.bottom, 50)
                
                Text("B. Restricted, Repetitive Patterns of Behavior, Interests, or Activities")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.bottom, 50)
                
                Spacer()
                
                if let socialTestItem = questionViewModel.currentBehaviorTestItem {
                    HStack {
                        Text(socialTestItem.description)
                            .font(.system(size: 30, weight: .light))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading) // 변경된 부분
                            .padding(.horizontal, 50)
                        Spacer() // 오른쪽 정렬을 위한 Spacer 추가
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        AnswerButton(title: "Yes") {
                            questionViewModel.userRespondedToBehaviorTest(response: .yes)
                        }
                        
                        AnswerButton(title: "No") {
                            questionViewModel.userRespondedToBehaviorTest(response: .no)
                        }
                        Spacer()
                        
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: TestResultView().onAppear(perform: {
                    questionViewModel.saveResultsToUserDefaults()
                }), isActive: $navigateToNext) {
                    ProgressButton(title: "Submit", progressAction: {
                        if questionViewModel.hasAnsweredAllBehaviorQuestions {
                            navigateToNext = true
                        }
                    }, disabled: questionViewModel.hasAnsweredAllBehaviorQuestions)
                }
            }
        }
    }
}

#Preview {
    BehaviorQuestionView()
        .environmentObject(UserInfo())
        .environmentObject(QuestionViewModel())
}
