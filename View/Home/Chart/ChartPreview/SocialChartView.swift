//
//  SocialChart.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI

struct SocialChart: View {
    var body: some View {
        GeometryReader { geometry in
            Text("Hello, SocialChart!")
                .frame(width: geometry.size.width, height: 500)
                .background(Color.main)
        }
    }
}

#Preview {
    SocialChart()
}
