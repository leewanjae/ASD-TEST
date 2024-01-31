//
//  File.swift
//
//
//  Created by 이완재 on 1/29/24.
//

import SwiftUI

enum SceneType: String, CaseIterable ,Identifiable {
    
    case StartTest = "Start Test"
    case AutismSpectrumTraits = "Autism Spectrum Traits"
    case TestResult = "Test Result"
    case AppSettings = "App Settings"
    
    var id: String { self.rawValue }
}
