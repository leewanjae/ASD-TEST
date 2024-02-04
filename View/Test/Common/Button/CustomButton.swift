//
//  CustomButton.swift
//
//
//  Created by 이완재 on 2/4/24.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    
    var body: some View {
            Text(title)
                .frame(width: 200, height: 50)
                .padding()
                .background(Color.main)
                .foregroundColor(.white)
                .clipShape(.capsule)
                .shadow(radius: 5)
    }
}

#Preview {
    CustomButton(title: "")
}
