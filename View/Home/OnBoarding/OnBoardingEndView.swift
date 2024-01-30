//
//  OnBoardingEndView.swift
//
//
//  Created by 이완재 on 1/29/24.
//

import SwiftUI

// MARK: - sheet 두 번째 페이지 
struct OnBoardingEndView: View {
    @Binding var showModal: Bool
    
    var body: some View {
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

#Preview {
    OnBoardingEndView(showModal: .constant(true))
}
