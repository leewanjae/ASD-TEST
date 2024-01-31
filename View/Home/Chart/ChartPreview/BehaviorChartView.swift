//
//  BehaviorChartView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI
import Charts

struct Posting: Identifiable {
    let name: String
    let count: Int
    
    var id: String { name }
}

let postings: [Posting] = [
    .init(name: "Green", count: 250),
    .init(name: "Blue", count: 100),
    .init(name: "Red", count: 180)
]


struct BehaviorChartView: View {
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
    BehaviorChartView()
}
