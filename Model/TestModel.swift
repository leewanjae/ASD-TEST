//
//  TestModel.swift
//
//
//  Created by 이완재 on 1/29/24.
//

import Foundation

struct TestItem<T> {
    var num: Int
    var description: String
    var yesCount: Int = 0
    var noCount: Int = 0
}

// SocialType과 BehaviorType 열거형으로 테스트 항목 유형 구분
enum SocialType {}
enum BehaviorType {}

// 타입 별칭을 사용하여 구체적인 테스트 항목 유형 정의
typealias SocialTestItem = TestItem<SocialType>
typealias BehaviorTestItem = TestItem<BehaviorType>

struct UserInfo {
    var id: UUID = UUID()
    var name: String
    var birthDate: Date
    var age: Int
    var socialTestResults: [SocialTestItem] = []
    var behaviorTestResults: [BehaviorTestItem] = []
    var completedTest: Bool
}

struct TestResult {
    var socialScore: Int
    var behaviorScore: Int
    var testDate: Date = Date()
}
