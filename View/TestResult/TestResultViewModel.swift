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
    func subscribeToQuestionVM(viewModel: QuestionViewModel) {
        viewModel.$socialTestResults
            .sink { [weak self] updateSocialResults in
                self?.socialTestResults = updateSocialResults
                print(updateSocialResults)
            }
            .store(in: &subscriptions)
        
        viewModel.$behaviorTestResults
            .sink { [weak self] updateBehaviorResults in
                self?.behaviorTestResults = updateBehaviorResults
                print(updateBehaviorResults)
            }
            .store(in: &subscriptions)
    }
    
}
