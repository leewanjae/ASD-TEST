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
    static func destinationView(scene: SceneType, questionViewModel: QuestionViewModel? = nil) -> some View {
        switch scene {
        case .StartTest:
            StartTestView()
        case .AutismSpectrumTraits:
            AutismSpectrumTraitsView()
        case .TestResult:
            if let viewModel = questionViewModel {
                TestResultView(viewModel: viewModel)
            } else {
                Text("Error: QuestionViewModel is required for TestResultView")
            }
        case .AppSettings:
            AppSettingsView()
        }
    }
}

#Preview {
    SceneViewBuilder() as! any View
}
