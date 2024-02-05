//
//  ProgressButton.swift
//
//
//  Created by 이완재 on 2/4/24.
//

import SwiftUI

struct ProgressButton: View {
    
    var progressAction: () -> Void
    
    var body: some View {
        Button(action: progressAction, label: {
            Text("Next")
                .frame(minWidth: 0, maxWidth: .infinity)  // 버튼의 너비를 확장
                .padding()
                .foregroundColor(.white)
                .background(Color.main)
                .clipShape(.capsule)
        })
    }
}

#Preview {
    ProgressButton(progressAction: {})
}
