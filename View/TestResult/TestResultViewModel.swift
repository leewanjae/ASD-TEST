//
//  TestResultViewModel.swift
//
//
//  Created by 이완재 on 2/11/24.
//

import Foundation
import Combine

class TestResultViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var socialTestResults: [SocialTestItem] = []
    @Published var behaviorTestResults: [BehaviorTestItem] = []

    //MARK: - 구독 설정
    func getUserAnswer(viewModel: QuestionViewModel) {
        viewModel.$socialTestResults
            .map({ $0.filter { $0.yesCount == 1 } })
            .sink { [weak self] updateSocialResults in
                self?.socialTestResults = updateSocialResults
                print(updateSocialResults)
            }
            .store(in: &subscriptions)
        
        viewModel.$behaviorTestResults
            .map({ $0.filter { $0.yesCount == 1 } })
            .sink { [weak self] updateBehaviorResults in
                self?.behaviorTestResults = updateBehaviorResults
                print(updateBehaviorResults)
            }
            .store(in: &subscriptions)
    }
    
    func summaryResult() -> String {
        let socialYesCount = socialTestResults.reduce(0) { $0 + $1.yesCount }
        let behaviorYesCount = behaviorTestResults.reduce(0) { $0 + $1.yesCount }
        var socialResult: String = ""
        var behaviorResult: String = ""
        let totalSocialQuestionCount = socialTestResults.reduce(0) { $0 + $1.description.count}
        
        // There are 6 social questions
        if socialYesCount >= 6 {
            socialResult = "Severity Level 3"
        } else if socialYesCount >= 4 {
            socialResult = "Severity Level 2"
        } else if socialYesCount >= 2 {
            socialResult = "Severity Level 1"
        } else {
            socialResult = "Low severity or no signs of autism spectrum disorder"
        }
        
        // There are 8 behavior questions
        if behaviorYesCount >= 6 {
            behaviorResult = "Severity Level 3"
        } else if behaviorYesCount >= 4 {
            behaviorResult = "Severity Level 2"
        } else if behaviorYesCount >= 2 {
            behaviorResult = "Severity Level 1"
        } else {
            behaviorResult = "Low severity or no signs of autism spectrum disorder"
        }
        
        // Compare and combine the severity of the two results
        if socialResult.contains("Severity Level 3") || behaviorResult.contains("Severity Level 3") {
            return "Immediate professional diagnosis is imperative \n\n\nCombined Severity Level: 3 \n\nSocial: \(socialResult) \n\nBehavior: \(behaviorResult)"
        } else if socialResult.contains("Severity Level 2") || behaviorResult.contains("Severity Level 2") {
            return "A professional consultation is strongly recommended \n\n\nCombined Severity Level: 2 \n\nSocial: \(socialResult) \n\nBehavior: \(behaviorResult)"
        } else if socialResult.contains("Severity Level 1") || behaviorResult.contains("Severity Level 1") {
            return "It's advisable to seek a professional evaluation \n\n\nCombined Severity Level: 1 \n\n\nSocial: \(socialResult) \n\nBehavior: \(behaviorResult)"
        } else {
            return "Low severity or no signs of autism spectrum disorder"
        }
    }
    
    func loadResultsFromUserDefaults() {
        if let savedSocialResults = UserDefaults.standard.data(forKey: "socialTestResults"),
           let savedBehaviorResults = UserDefaults.standard.data(forKey: "behaviorTestResults") {
            socialTestResults = (try? JSONDecoder().decode([SocialTestItem].self, from: savedSocialResults)) ?? []
            behaviorTestResults = (try? JSONDecoder().decode([BehaviorTestItem].self, from: savedBehaviorResults)) ?? []
        }
    }
}
