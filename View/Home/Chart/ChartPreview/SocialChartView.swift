//
//  SocialChartView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI
import Charts

struct SocialChartView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        Chart {
            ForEach(userInfo.socialTestResults.indices, id: \.self) { index in
                let testItem = userInfo.socialTestResults[index]
                let postingName = "Question \(testItem.num)"
                let postingCount = testItem.yesCount
                
                BarMark(
                    x: .value("Question", postingName),
                    y: .value("Yes Count", postingCount)
                )
                .foregroundStyle(by: .value("Question", postingName))
            }
        }
        .padding()
        .chartForegroundStyleScale([
            "Question 1": .green,
            "Question 2": .blue,
            "Question 3": .red,
            "Question 4": .orange,
            "Question 5": .purple,
            "Question 6": .yellow
        ])
        .background(.regularMaterial)
        .border(.secondary, width: 2)
    }
}
#Preview {
    SocialChartView()
}
