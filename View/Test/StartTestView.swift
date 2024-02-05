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
    
    var body: some View {
        NavigationStack {
            VStack() {
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 30)
                // MARK: - 유저 정보 입력
                VStack(alignment: .leading) {
                    Text("Full Name ")
                        .font(.system(size: 25))
                    TextField("Enter your full name, please", text: $userInfo.name)
                        .border(.black)
                        .frame(width: 400)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.default)
                        .padding(.bottom, 30)
                    
                    HStack {
                        DatePicker("", selection: $userInfo.birthDate, in: ...Date(), displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .frame(width: 300)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 25))
                            .padding(.bottom, 30)
                            .padding(.trailing, 30)
                        
                        Text("Age: \(userInfo.age)")
                            .font(.system(size: 25))
                    }
                }
                
                VStack{
                    // MARK: - 설명 부분
                    Text("The results will be provided in a graph and can be reviewed at any time.\n\nPlease note that this assessment does not represent a professional diagnosis.\n\nThis test is based on the DSM-5 TR, which is the revised edition of the DSM-5 published by the American Psychiatric Association (APA) in 2013.")
                        .italic()
                        .font(.system(size: 25))
                        .padding(.bottom, 50)
                    
                    // MARK: - 버튼
                    
                    NavigationLink(destination: QuestionView()) {
                        DefaultButton(title: "Start")
                    }
                }
                Spacer()
            }
            .background(Color.white)
        }
    }
}

#Preview {
    StartTestView()
}
