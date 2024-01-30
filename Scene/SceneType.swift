//
//  File.swift
//
//
//  Created by 이완재 on 1/29/24.
//

import SwiftUI

enum SceneType: String, CaseIterable ,Identifiable {
    
    case TestStart
    case UnderstandingASD
    case TipsForParents
    case AppSettings
    
    var id: String { self.rawValue }
}
