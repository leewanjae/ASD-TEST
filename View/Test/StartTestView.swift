//
//  StartTestView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI
import Combine

struct StartTestView: View {
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @State private var navigateToNext = false
    
    var body: some View {
        ScrollView {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 30)
                // MARK: - 유저 정보 입력
                VStack {
                    Text("Full Name")
                        .font(.system(size: 25))
                        .padding(.bottom, 30)
                    TextField("Enter", text: $userInfo.name)
                        .padding()
                        .border(.black)
                        .frame(width: 500)
                        .padding(.bottom, 30)
                    
                    Spacer()
                    
                    Text("Age: \(userInfo.age)")
                        .font(.system(size: 25))
                        .padding(.bottom, 10)

                    DatePicker("", selection: $userInfo.birthDate, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .frame(width: 500, height: 400)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 30)
                }
                
                VStack{
                    // MARK: - 설명 부분
                    Text("The results will be provided in a graph and can be reviewed at any time.\n\nPlease note that this assessment does not represent a professional diagnosis.\n\nThis test is based on the DSM-5 TR, which is the revised edition of the DSM-5 published by the American Psychiatric Association (APA) in 2013.")
                        .italic()
                        .font(.system(size: 25))
                        .padding(.bottom, 50)
                    
                    // MARK: - 버튼
                    NavigationLink(destination: SocialQuestionView().onAppear(perform: {
                        
                    }), isActive: $navigateToNext) {
                        DefaultButton(title: "Start", action: {
                            navigateToNext = true
                        })
                    }
                }
            }
            .background(Color.white)
        }
        .onAppear {
            userInfo.reset()
            questionViewModel.userDefaultsReset()
            questionViewModel.clearTestData()
        }
    }
}

#Preview {
    StartTestView()
        .environmentObject(UserInfo())
        .environmentObject(QuestionViewModel())
}
