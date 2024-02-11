//
//  AnswerButton.swift
//
//
//  Created by 이완재 on 2/9/24.
//

import SwiftUI

struct AnswerButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        
        Button(
            action: {
                action()
            },
            label: {
                Text(title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .background(Color.main)
                    .cornerRadius(30)
                    .padding(.horizontal, 5)
            }
        )
    }
}

#Preview {
    AnswerButton(title: "", action: {})
}
