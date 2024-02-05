//
//  QuestionView.swift
//
//
//  Created by 이완재 on 2/2/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State private var progress = 0.1
    @State private var showAlter = false
    @State private var navigateToNext = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Name: \(userInfo.name)")
                        .padding(.trailing, 50)
                    Text("Age(Year): \(userInfo.age)")
                }
                
                ProgressView(value: progress, total: 1.0)
                    .progressViewStyle(.linear)
                    .frame(height: 20)
                    .padding()
                
                Spacer()
                
                Text("여기에 내용을 넣을 것 입니다.")
                
                Spacer()
                
                NavigationLink(destination: Question2(), isActive: $navigateToNext) {
                    ProgressButton {
                            progress += 0.1
                            navigateToNext = true
                    }
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
    QuestionView()
}
