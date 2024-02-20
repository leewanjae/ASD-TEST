//
//  Education.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI

struct Education: View {
    @State var selectedTab = 0
    
    var body: some View {
        ScrollView {
            Text("Education")
                .font(.largeTitle)
                .bold()
            
            CreateContextView()
            DTTView()
            PRTView()
        }
        .padding()
    }
}

#Preview {
    Education()
}
