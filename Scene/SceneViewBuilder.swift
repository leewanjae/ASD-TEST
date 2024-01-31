//
//  SceneViewBuilder.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI

// MARK: - ViewBuiler
struct SceneViewBuilder {
    @ViewBuilder
    static func destinationView(scene: SceneType) -> some View {
        switch scene {
        case .StartTest:
            StartTestView()
        case .AutismSpectrumTraits:
            AutismSpectrumTraitsView()
        case .TestResult:
            TestResultView()
        case .AppSettings:
            AppSettingsView()
        }
    }
}

#Preview {
    SceneViewBuilder() as! any View
}
