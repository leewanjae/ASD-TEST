//
//  SocialQuestionView.swift
//
//
//  Created by 이완재 on 2/2/24.
//

import SwiftUI

struct SocialQuestionView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var progress = 0.1
    @State private var showAlter = false
    @State private var navigateToNext = false
    @StateObject private var viewModel = QuestionViewModel()
    
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
                
                Text("A. Persistent Deficits in Social Communication and Interaction")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.bottom, 50)
                
                Spacer()

                if let socialTestItem = viewModel.currentSocialTestItem {
                    Text(socialTestItem.description)
                        .font(.system(size: 30, weight: .light))
                        .padding(.horizontal, 50)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        AnswerButton(title: "Yes") {
                            viewModel.userRespondedToSocialTest(response: .yes)
                        }
                        
                        AnswerButton(title: "No") {
                            viewModel.userRespondedToSocialTest(response: .no)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
                NavigationLink(destination: BehaviorQuestionView(viewModel: viewModel), isActive: $navigateToNext) {
                    ProgressButton(title: "Next Categori", progressAction: {
                        if viewModel.hasAnsweredAllSocialQuestions {
                            navigateToNext = true
                        }
                    }, disabled: viewModel.hasAnsweredAllSocialQuestions)
                }
            }
        }
    }
}

#Preview{
    SocialQuestionView()
}
