//
//  File.swift
//
//
//  Created by 이완재 on 1/29/24.
//

import SwiftUI

enum SceneType: String, CaseIterable ,Identifiable {
    
    case StartTest = "Start Test"
    case ASDTraits = "ASD Traits"
    case TestResult = "Test Result"
    case Education = "Education"
    
    var id: String { self.rawValue }
}
