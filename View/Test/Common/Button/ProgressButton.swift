//
//  ProgressButton.swift
//
//
//  Created by 이완재 on 2/4/24.
//

import SwiftUI

struct ProgressButton: View {
    var title: String
    var progressAction: () -> Void
    var disabled: Bool

    var body: some View {
        Button(action: progressAction) {
            Text(title)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 80)
                .padding()
                .foregroundColor(.white)
                .background(disabled ? Color.main : Color.gray)
                .font(.system(size: 25))
        }
        .disabled(disabled)
    }
}

#Preview {
    ProgressButton(title: "Stub", progressAction: {}, disabled: true)
}
