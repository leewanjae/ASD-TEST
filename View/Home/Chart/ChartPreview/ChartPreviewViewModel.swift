//
//  ChartPreviewViewModel.swift
//
//
//  Created by 이완재 on 2/19/24.
//

import Foundation
import Combine

class ChartPreviewViewModel: ObservableObject {
    @Published var socialTestResults: [SocialTestItem] = []
    @Published var behaviorTestResults: [BehaviorTestItem] = []
    
    func loadSocialTestResultsFromUserDefaults() {
        if let savedResults = UserDefaults.standard.data(forKey: "socialTestResults"),
           let decodedResults = try? JSONDecoder().decode([SocialTestItem].self, from: savedResults) {
            socialTestResults = decodedResults
        }
    }
    
    func loadBehaviorTestResultsFromUserDefaults() {
        if let savedResults = UserDefaults.standard.data(forKey: "behaviorTestResults"),
           let decodedResults = try? JSONDecoder().decode([BehaviorTestItem].self, from: savedResults) {
            behaviorTestResults = decodedResults
        }
    }
}
