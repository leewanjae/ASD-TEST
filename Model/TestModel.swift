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

enum SocialType {}
enum BehaviorType {}

typealias SocialTestItem = TestItem<SocialType>
typealias BehaviorTestItem = TestItem<BehaviorType>

struct TestResult {
    var socialScore: Int
    var behaviorScore: Int
    var testDate: Date = Date()
}
