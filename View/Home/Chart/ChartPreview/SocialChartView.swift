//
//  SocialChartView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI
import Charts

struct SocialChartView: View {
    @StateObject var viewModel = ChartPreviewViewModel()
    
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
            ForEach(viewModel.socialTestResults.indices, id: \.self) { index in
                let testItem = viewModel.socialTestResults[index]
                let categoryName = xName[index % xName.count]
                let postingCount = testItem.yesCount
                
                BarMark(
                    x: .value("Category", categoryName),
                    y: .value("Yes Count", postingCount)
                )
                .foregroundStyle(by: .value("Category", categoryName))
            }
        }
        .padding()
        .chartForegroundStyleScale([
            "Emotion Sharing": Color.chartBar1,
            "Conversation Interaction": Color.chartBar2,
            "Nonverbal Communication": Color.chartBar3,
            "Social Interaction & Building": Color.chartBar4
        ])
        .background(.regularMaterial)
        .border(.secondary, width: 2)
        .onAppear {
            viewModel.loadSocialTestResultsFromUserDefaults()
        }
    }
}

#Preview {
    SocialChartView()
}
