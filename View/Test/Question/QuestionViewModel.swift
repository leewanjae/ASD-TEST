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
            "1. Does your child struggle to share emotions or interests with others? \n(For example, not sharing enjoyment or things they are interested in)",
            "2. Does your child repeatedly mention their own interests instead of responding naturally to what the other person says during a conversation?",
            "3. Does your child avoid eye contact or struggle to use nonverbal communication (like facial expressions, gestures) appropriately?",
            "4. During conversations, does your child fail to use appropriate body language, such as leaning in or nodding?",
            "5. Does your child have difficulty initiating or maintaining interaction with peers?",
            "6. Does your child find it hard to make friends or integrate into peer groups?"
        ]
        
        behaviorQuestions = [
            "1. Does your child display repetitive motor movements like hand-flapping, rocking, or spinning objects?",
            "2. Does your child repeat specific words or phrases, or mimic lines from TV shows or advertisements verbatim??",
            "3. Does your child become extremely upset with minor changes in routine?",
            "4. Does your child become anxious if they cannot follow their usual patterns or routines?",
            "5. Does your child show an unusual level of attachment to specific topics or activities?",
            "6. Are your child's interests overly restricted or obsessive?",
            "7. Does your child show an unusual response to certain sounds, textures, smells, or visual stimuli (e.g., indifference to pain/temperature, aversion to specific sounds or textures)?",
            "8. Does your child show an unusual interest in observing or touching objects, or a fascination with lights or moving objects?"
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
