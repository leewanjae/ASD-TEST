//
//  SocialQuestionView.swift
//
//
//  Created by 이완재 on 2/2/24.
//

import SwiftUI

struct SocialQuestionView: View {
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var questionViewModel: QuestionViewModel
    
    @State var progress = 0.1
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
                
                Text("A. Persistent Deficits in Social Communication and Interaction")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.bottom, 50)
                
                Spacer()
                
                if let socialTestItem = questionViewModel.currentSocialTestItem {
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
                            questionViewModel.userRespondedToSocialTest(response: .yes)
                        }
                        
                        AnswerButton(title: "No") {
                            questionViewModel.userRespondedToSocialTest(response: .no)
                        }
                        Spacer()
                    }
                    .alert(isPresented: $questionViewModel.showAlert, content: {
                        Alert(title: Text("Success"), message: Text("All answers have been completed. Please press the Next button."), dismissButton: .default(Text("OK")))
                    })
                    Spacer()
                }
                
                NavigationLink(destination: BehaviorQuestionView(), isActive: $navigateToNext) {
                    ProgressButton(title: "Next Categori", progressAction: {
                        if questionViewModel.hasAnsweredAllSocialQuestions {
                            navigateToNext = true
                        }
                    }, disabled: questionViewModel.hasAnsweredAllSocialQuestions)
                }
            }
        }
    }
}

#Preview {
    SocialQuestionView()
        .environmentObject(UserInfo())
        .environmentObject(QuestionViewModel())
}
