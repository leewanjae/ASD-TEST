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
                
                ProgressView(value: viewModel.progress, total: 1.0)
                    .progressViewStyle(.linear)
                    .frame(height: 20)
                    .padding()
                
                Spacer()
                
                if let socialTestItem = viewModel.currentSocialTestItem {
                    Text(socialTestItem.description)
                    HStack {
                        Button("Yes") {
                            viewModel.userRespondedToSocialTest(response: .yes)
                        }
                        
                        Button("No") {
                            viewModel.userRespondedToSocialTest(response: .no)
                        }
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: BehaviorQuestionView(viewModel: viewModel), isActive: $navigateToNext) {
                    ProgressButton(title: "Next Categori", progressAction: {
                        if viewModel.hasAnsweredAllSocialQuestions {
                            navigateToNext = true
                        }
                    }, disabled: viewModel.hasAnsweredAllSocialQuestions)
                   
                }
            }
            .onChange(of: progress, perform: { newValue in
                if newValue >= 0.9 {
                    showAlter = true
                }
            })
            .alert("Success", isPresented: $showAlter) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Analyzing, please wait for a moment")
            }
        }
    }
}

#Preview{
    SocialQuestionView()
}
