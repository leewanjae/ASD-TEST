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
        case .TestStart:
            TestStartView()
        case .UnderstandingASD:
            UnderstandingASDView()
        case .TipsForParents:
            TipsForParentsView()
        case .AppSettings:
            AppSettingsView()
        }
    }
}

#Preview {
    SceneViewBuilder() as! any View
}
