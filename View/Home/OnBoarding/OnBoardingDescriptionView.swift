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
    @Binding var showModal: Bool

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("onboard")
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
            Button {
                showModal = false
            } label: {
                Text("Start")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.black)
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    OnBoardingDescriptionView(showModal: .constant(true))
}
