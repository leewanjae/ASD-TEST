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
    var userInfo: UserInfo
    
    @Published var progress: Double = 0.0
    @Published var currentSocialTestItem: SocialTestItem?
    @Published var currentBehaviorTestItem: BehaviorTestItem?

    private var socialQuestions: [String]
    private var behaviorQuestions: [String]

    private var currentSocialQuestionIndex = 0
    private var currentBehaviorQuestionIndex = 0

    var hasAnsweredAllSocialQuestions: Bool {
        currentSocialQuestionIndex >= socialQuestions.count
    }
    var hasAnsweredAllBehaviorQuestions: Bool {
        currentBehaviorQuestionIndex >= behaviorQuestions.count
    }
    
    init() {
        
        userInfo = UserInfo()
        
        // 사회성 테스트와 행동 테스트를 위한 질문 목록 초기화
        socialQuestions = [
            "Do you feel comfortable in large gatherings?",
            "Would you prefer to work on a team project?",
            "Do you feel comfortable in large gatherings?",
            "Would you prefer to work on a team project?",
            "Do you feel comfortable in large gatherings?",
            "Would you prefer to work on a team project?"
        ]
        
        behaviorQuestions = [
            "Do you find it easy to adapt to new situations?",
            "Are you a meticulous planner?",
            "Do you find it easy to adapt to new situations?",
            "Are you a meticulous planner?",
            "Do you find it easy to adapt to new situations?",
            "Are you a meticulous planner?"
        ]

        // 첫 번째 질문으로 초기화
        nextSocialQuestion()
        nextBehaviorQuestion()
    }
    
    // MARK: - 소셜파트 인덱스에 따른 질문 제공
    func nextSocialQuestion() {
        if currentSocialQuestionIndex < socialQuestions.count {
            let question = socialQuestions[currentSocialQuestionIndex]
            currentSocialTestItem = SocialTestItem(num: currentSocialQuestionIndex + 1, description: question)
            currentSocialQuestionIndex += 1
        }
    }
    
    // MARK: - 행동파트 인덱스에 따른 질문 제공
    func nextBehaviorQuestion() {
        if currentBehaviorQuestionIndex < behaviorQuestions.count {
            let question = behaviorQuestions[currentBehaviorQuestionIndex]
            currentBehaviorTestItem = BehaviorTestItem(num: currentBehaviorQuestionIndex + 1, description: question)
            currentBehaviorQuestionIndex += 1
        }
    }
    
    //MARK: - progress 업데이트
    func updateProgress() {
        let totalQuestions = socialQuestions.count + behaviorQuestions.count
        let answeredQuestions = currentSocialQuestionIndex + currentBehaviorQuestionIndex
        progress = Double(answeredQuestions) / Double(totalQuestions)
    }

    // MARK: - 소셜파트 yes or no 카운트 후 UserInfo로 결과값 전송
    func userRespondedToSocialTest(response: ResponseType) {
        guard var testItem = currentSocialTestItem else { return }
        switch response {
        case .yes:
            testItem.yesCount += 1
        case .no:
            testItem.noCount += 1
        }
        nextSocialQuestion()
        updateProgress()
    }
    
    // MARK: - 행동파트 yes or no 카운트 후 UserInfo로 결과값 전송
    func userRespondedToBehaviorTest(response: ResponseType) {
        guard var testItem = currentBehaviorTestItem else { return }
        switch response {
        case .yes:
            testItem.yesCount += 1
        case .no:
            testItem.noCount += 1
        }
        nextBehaviorQuestion()
        updateProgress()
    }
}
