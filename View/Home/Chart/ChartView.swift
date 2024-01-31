//
//  ChartView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI

struct ChartView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            // MARK: - 세그먼티드 컨트롤
            Picker("Options", selection: $selectedTab) {
                Text("Social")
                    .tag(0)
                Text("Behavior")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            
            // 선택된 탭에 따라 다른 뷰 표시
            if selectedTab == 0 {
                SocialChartView()
            } else if selectedTab == 1 {
                BehaviorChartView()
            }
            
            Spacer()
        }
    }
}
