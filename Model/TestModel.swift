//
//  TestModel.swift
//
//
//  Created by 이완재 on 1/29/24.
//

import Foundation

struct TestItem<T>: Hashable {
    var num: Int
    var description: String
    var yesCount: Int
    var noCount: Int
}

enum SocialType {}
enum BehaviorType {}

typealias SocialTestItem = TestItem<SocialType>
typealias BehaviorTestItem = TestItem<BehaviorType>

struct TestResult {
    var description: String
    var result: String
}
