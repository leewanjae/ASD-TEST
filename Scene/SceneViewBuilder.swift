//
//  SceneViewBuilder.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI

// MARK: - ViewBuilder
struct SceneViewBuilder {
    @ViewBuilder
    static func destinationView(scene: SceneType) -> some View {
        switch scene {
        case .StartTest:
            StartTestView()
        case .ASDTraits:
            ASDTraits()
        case .TestResult:
                TestResultView()
        case .Education:
            Education()
        }
    }
}

#Preview {
    SceneViewBuilder() as! any View
}
