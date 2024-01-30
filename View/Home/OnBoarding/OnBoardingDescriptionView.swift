//
//  OnBoardingDescriptionView.swift
//  ASDTest
//
//  Created by 이완재 on 1/28/24.
//

import SwiftUI

// MARK: - sheet 첫번째 페이지
struct OnBoardingDescriptionView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("onboard")
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.gray)
                        .padding(.leading, 5)
                        .offset(x: animate ? 0 : -20)
                        .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: animate)
                        .onAppear {
                            animate = true
                        }
                }
            }
        }
    }
}
