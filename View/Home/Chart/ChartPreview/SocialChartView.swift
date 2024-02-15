//
//  SocialChartView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI
import Charts

struct SocialChartView: View {
    @EnvironmentObject var questionViewModel: QuestionViewModel
    let xName = [
        "Emotion Sharing",
        "Emotion Sharing",
        "Conversation Interaction",
        "Conversation Interaction",
        "Nonverbal Communication",
        "Nonverbal Communication",
        "Social Interaction & Building",
        "Social Interaction & Building"
    ]
    
    var body: some View {
        
        Chart {
            ForEach(questionViewModel.socialTestResults.indices, id: \.self) { index in
                let testItem = questionViewModel.socialTestResults[index]
                let categoryName = xName[index % xName.count]
                let postingCount = testItem.yesCount

                // 실제 값에 대한 막대
                BarMark(
                    x: .value("Category", categoryName),
                    y: .value("Yes Count", postingCount)
                )
                .foregroundStyle(by: .value("Category", categoryName))
            }
        }
        .padding()
        .chartForegroundStyleScale([
            "Emotion Sharing": .red,
            "Conversation Interaction": .orange,
            "Nonverbal Communication": .yellow,
            "Social Interaction & Building": .green
        ])
        .background(.regularMaterial)
        .border(.secondary, width: 2)
    }
}
#Preview {
    SocialChartView()
        .environmentObject(QuestionViewModel())
}
