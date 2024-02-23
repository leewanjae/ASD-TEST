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
    @Published var showAlert = false
    @Published var progress: Double = 0.0
    @Published var currentSocialTestItem: SocialTestItem?
    @Published var currentBehaviorTestItem: BehaviorTestItem?
    
    @Published var socialTestResults: [SocialTestItem] = []
    @Published var behaviorTestResults: [BehaviorTestItem] = []
    
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
        
        // 사회성 테스트와 행동 테스트를 위한 질문 목록 초기화
        socialQuestions = [
            "1. Does your child struggle to share emotions or interests with others? \n(For example, not sharing enjoyment or things they are interested in) \n[Emotion Sharing]",
            "2. Does your child have trouble understanding or responding to other people's feelings? \n[Emotion Sharing]",
            "3. Does your child repeatedly mention their own interests instead of responding naturally to what the other person says during a conversation? \n[Conversation Interaction]",
            "4. Does your child find it difficult to adjust their conversation based on the listener's reactions or the context of the situation? \n[Conversation Interaction]",
            "5. Does your child avoid eye contact or struggle to use nonverbal communication (like facial expressions, gestures) appropriately? \n[Nonverbal Communication]",
            "6. During conversations, does your child fail to use appropriate body language, such as leaning in or nodding? \n[Nonverbal Communication]",
            "7. Does your child have difficulty initiating or maintaining interaction with peers? \n[Social Interaction & Building]",
            "8. Does your child find it hard to make friends or integrate into peer groups? \n[Social Interaction & Building]"
        ]
        
        behaviorQuestions = [
            "1. Does your child display repetitive motor movements like hand-flapping, rocking, or spinning objects? \n[Repetitive Behavior Patterns]",
            "2. Does your child repeat specific words or phrases, or mimic lines from TV shows or advertisements verbatim? \n[Repetitive Behavior Patterns]",
            "3. Does your child become extremely upset with minor changes in routine? \n[Overreaction to Routine Changes]",
            "4. Does your child become anxious if they cannot follow their usual patterns or routines? \n[Overreaction to Routine Changes]",
            "5. Does your child show an unusual level of attachment to specific topics or activities? \n[Specific Obsessions]",
            "6. Are your child's interests overly restricted or obsessive? \n[Specific Obsessions]",
            "7. Does your child show an unusual response to certain sounds, textures, smells, or visual stimuli (e.g., indifference to pain/temperature, aversion to specific sounds or textures)? \n[Unusual Sensory Responses]",
            "8. Does your child show an unusual interest in observing or touching objects, or a fascination with lights or moving objects? \n[Unusual Sensory Responses]"
        ]
        
        // 첫 번째 질문으로 초기화
        nextSocialQuestion()
        nextBehaviorQuestion()
    }
    
    // MARK: - 소셜파트 인덱스에 따른 질문 제공
    func nextSocialQuestion() {
        if currentSocialQuestionIndex < socialQuestions.count {
            let question = socialQuestions[currentSocialQuestionIndex]
            currentSocialTestItem = SocialTestItem(num: currentSocialQuestionIndex + 1, description: question, yesCount: 0, noCount: 0)
        } else {
            
        }
    }
    
    // MARK: - 행동파트 인덱스에 따른 질문 제공
    func nextBehaviorQuestion() {
        if currentBehaviorQuestionIndex < behaviorQuestions.count {
            let question = behaviorQuestions[currentBehaviorQuestionIndex]
            currentBehaviorTestItem = BehaviorTestItem(num: currentBehaviorQuestionIndex + 1, description: question, yesCount: 0, noCount: 0)
        }
    }
    
    //MARK: - progress 업데이트
    func updateProgress() {
        let totalQuestions = socialQuestions.count + behaviorQuestions.count
        let answeredQuestions = currentSocialQuestionIndex + currentBehaviorQuestionIndex
        progress = Double(answeredQuestions) / Double(totalQuestions)
    }
    
    // MARK: - 소셜파트 yes or no 카운트
    func userRespondedToSocialTest(response: ResponseType) {
        if hasAnsweredAllSocialQuestions {
            showAlert = true
        } else {
            guard var testItem = currentSocialTestItem, currentSocialQuestionIndex < socialQuestions.count else { return }
            switch response {
            case .yes:
                testItem.yesCount += 1
            case .no:
                testItem.noCount += 1
            }
            if currentSocialQuestionIndex < socialQuestions.count {
                currentSocialQuestionIndex += 1
                nextSocialQuestion()
            }
            updateProgress()

            // 배열의 크기가 이미 문제 갯수와 같은 경우, 가장 오래된 결과를 제거
            if socialTestResults.count >= socialQuestions.count {
                socialTestResults.removeFirst()
            }

            // 수정된 testItem을 배열에 추가
            socialTestResults.append(testItem)
        }
    }
    
    // MARK: - 행동파트 yes or no 카운트
    func userRespondedToBehaviorTest(response: ResponseType) {
        if hasAnsweredAllBehaviorQuestions {
            showAlert = true
        } else {
            guard var testItem = currentBehaviorTestItem, currentBehaviorQuestionIndex < behaviorQuestions.count else { return }
            switch response {
            case .yes:
                testItem.yesCount += 1
            case .no:
                testItem.noCount += 1
            }
            
            if currentBehaviorQuestionIndex < behaviorQuestions.count {
                currentBehaviorQuestionIndex += 1
                nextBehaviorQuestion()
            }
            
            updateProgress()

            // 배열의 크기가 이미 문제 개수와 같은 경우, 가장 오래된 결과를 제거
            if behaviorTestResults.count >= behaviorQuestions.count {
                behaviorTestResults.removeFirst()
            }

            // 수정된 testItem을 배열에 추가
            behaviorTestResults.append(testItem)
        }
    }
    
    func clearTestData() {
        currentSocialQuestionIndex = 0
        currentBehaviorQuestionIndex = 0
        progress = 0.0
        currentSocialTestItem = nil
        currentBehaviorTestItem = nil
        nextSocialQuestion()
        nextBehaviorQuestion()
    }
    
    func saveResultsToUserDefaults() {
        // 사회성 테스트 결과 저장
        let socialCount = min(socialTestResults.count, socialQuestions.count)
        if let encodedSocialResults = try? JSONEncoder().encode(Array(socialTestResults.suffix(socialCount))) {
            UserDefaults.standard.set(encodedSocialResults, forKey: "socialTestResults")
        }

        // 행동 테스트 결과 저장
        let behaviorCount = min(behaviorTestResults.count, behaviorQuestions.count)
        if let encodedBehaviorResults = try? JSONEncoder().encode(Array(behaviorTestResults.suffix(behaviorCount))) {
            UserDefaults.standard.set(encodedBehaviorResults, forKey: "behaviorTestResults")
        }
    }

    
    func userDefaultsReset() {
        if let emptySocialResults = try? JSONEncoder().encode([SocialTestItem]()),
           let emptyBehaviorResults = try? JSONEncoder().encode([BehaviorTestItem]()) {
            UserDefaults.standard.set(emptySocialResults, forKey: "socialTestResults")
            UserDefaults.standard.set(emptyBehaviorResults, forKey: "behaviorTestResults")
        }
        
        UserDefaults.standard.set("Low severity or no signs of autism spectrum disorder", forKey: "TestResultSummary")
        UserDefaults.standard.set("The user's name is missing", forKey: "userName")
    }
}
