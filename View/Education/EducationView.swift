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
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
            
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
