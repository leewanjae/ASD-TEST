//
//  QuestionViewModel.swift
//
//
//  Created by 이완재 on 2/2/24.
//

import Foundation
import Combine

enum ResponseType {
    case yes
    case no
}

class QuestionViewModel: ObservableObject {
    @Published var currentSocialTestItem: SocialTestItem?
    @Published var currentBehaviorTestItem: BehaviorTestItem?

    private var socialQuestions: [String]
    private var behaviorQuestions: [String]

    private var currentSocialQuestionIndex = 0
    private var currentBehaviorQuestionIndex = 0

    init() {
        // 사회성 테스트와 행동 테스트를 위한 질문 목록 초기화
        socialQuestions = [
            "Do you feel comfortable in large gatherings?",
            "Would you prefer to work on a team project?"
        ]
        
        behaviorQuestions = [
            "Do you find it easy to adapt to new situations?",
            "Are you a meticulous planner?"
        ]

        // 첫 번째 질문으로 초기화
        nextSocialQuestion()
        nextBehaviorQuestion()
    }

    func nextSocialQuestion() {
        if currentSocialQuestionIndex < socialQuestions.count {
            let question = socialQuestions[currentSocialQuestionIndex]
            currentSocialTestItem = SocialTestItem(num: currentSocialQuestionIndex + 1, description: question)
            currentSocialQuestionIndex += 1
        }
    }

    func nextBehaviorQuestion() {
        if currentBehaviorQuestionIndex < behaviorQuestions.count {
            let question = behaviorQuestions[currentBehaviorQuestionIndex]
            currentBehaviorTestItem = BehaviorTestItem(num: currentBehaviorQuestionIndex + 1, description: question)
            currentBehaviorQuestionIndex += 1
        }
    }

    func userRespondedToSocialTest(response: ResponseType) {
        guard var testItem = currentSocialTestItem else { return }
        switch response {
        case .yes:
            testItem.yesCount += 1
        case .no:
            testItem.noCount += 1
        }
        socialTestResults.append(testItem)
        nextSocialQuestion()
    }

    func userRespondedToBehaviorTest(response: ResponseType) {
        guard var testItem = currentBehaviorTestItem else { return }
        switch response {
        case .yes:
            testItem.yesCount += 1
        case .no:
            testItem.noCount += 1
        }
        behaviorTestResults.append(testItem)
        nextBehaviorQuestion()
    }
    
    // 사회성 테스트와 행동 테스트 결과를 저장하는 배열
    var socialTestResults: [SocialTestItem] = []
    var behaviorTestResults: [BehaviorTestItem] = []
}
