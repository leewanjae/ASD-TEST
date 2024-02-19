//
//  BehaviorChartView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI
import Charts

struct BehaviorChartView: View {
    @StateObject var viewModel = ChartPreviewViewModel()

    var body: some View {
        let xName = [
            "Repetitive Behavior Patterns",
            "Repetitive Behavior Patterns",
            "Overreaction to Routine Changes",
            "Overreaction to Routine Changes",
            "Specific Obsessions",
            "Specific Obsessions",
            "Unusual Sensory Responses",
            "Unusual Sensory Responses"
        ]
        
        Chart {
            ForEach(viewModel.behaviorTestResults.indices, id: \.self) { index in
                let testItem = viewModel.behaviorTestResults[index]
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
            "Repetitive Behavior Patterns": Color.chartBar1,
            "Overreaction to Routine Changes": Color.chartBar2,
            "Specific Obsessions": Color.chartBar3,
            "Unusual Sensory Responses": Color.chartBar4,
        ])
        .background(.regularMaterial)
        .border(.secondary, width: 2)
        .onAppear {
            viewModel.loadBehaviorTestResultsFromUserDefaults()
        }
    }
}

#Preview {
    BehaviorChartView()
}
