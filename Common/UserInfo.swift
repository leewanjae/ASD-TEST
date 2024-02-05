//
//  UserInfo.swift
//
//
//  Created by 이완재 on 2/5/24.
//

import Foundation
import Combine

class UserInfo: ObservableObject {
    @Published var id: UUID = UUID()
    @Published var name: String = "Unknown Name"
    @Published var birthDate: Date = Date()
    
    var age: Int {
        Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year ?? 0
    }
    
    @Published var socialTestResults: [SocialTestItem] = []
    @Published var behaviorTestResults: [BehaviorTestItem] = []
    @Published var completedTest: Bool = false
    
    func addSocialTestResult(_ result: SocialTestItem) {
        socialTestResults.append(result)
    }
    
    func addBehaviorTestResult(_ result: BehaviorTestItem) {
        behaviorTestResults.append(result)
    }
}
