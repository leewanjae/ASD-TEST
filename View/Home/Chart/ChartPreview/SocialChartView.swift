//
//  SocialChartView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI
import Charts

struct SocialChartView: View {
    var body: some View {
        Chart {
            ForEach(postings) { posting in
                BarMark(x: .value("Posting", posting.count), y: .value("Name", posting.name))
            }
        }
        .padding()
        .foregroundColor(.main)
        .background(.regularMaterial)
        .border(.secondary, width: 2)
    }
}

#Preview {
    SocialChartView()
}
