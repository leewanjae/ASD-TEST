//
//  DefaultButton.swift
//
//
//  Created by 이완재 on 2/4/24.
//

import SwiftUI

struct DefaultButton: View {
    var title: String
    
    init(title: String = "Next") {
        self.title = title
    }
    
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
    DefaultButton(title: "")
}
