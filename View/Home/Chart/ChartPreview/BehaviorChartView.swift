//
//  BehaviorChartView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI
import Charts

struct BehaviorChartView: View {
    @EnvironmentObject var questionViewModel: QuestionViewModel
    
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
            ForEach(questionViewModel.behaviorTestResults.indices, id: \.self) { index in
                let testItem = questionViewModel.behaviorTestResults[index]
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
            "Repetitive Behavior Patterns": .red,
            "Overreaction to Routine Changes": .orange,
            "Specific Obsessions": .yellow,
            "Unusual Sensory Responses": .green,
        ])
        .background(.regularMaterial)
        .border(.secondary, width: 2)
    }
}

#Preview {
    BehaviorChartView()
        .environmentObject(QuestionViewModel())
}
