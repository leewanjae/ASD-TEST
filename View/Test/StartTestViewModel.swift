//
//  StartTestViewModel.swift
//
//
//  Created by 이완재 on 2/2/24.
//
import Foundation
import Combine

class StartTestViewModel: ObservableObject {
    @Published var userInfo: UserInfo
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init() {
        userInfo = UserInfo(id: UUID(), name: "Unknown Name", birthDate: Date(), age: 0, completedTest: false)
    }
    
    func setupSubscriptions() {
        setupNameSubscription()
        setupAgeSubscription()
    }
    
    private func setupNameSubscription() {
        $userInfo
            .map { $0.name }
            .removeDuplicates() // 동일한 이름에 대한 중복 업데이트를 방지
            .throttle(for: .seconds(1), scheduler: RunLoop.main, latest: true) // 1초 간격으로 throttle 적용
            .sink { [weak self] newName in
                self?.userInfo.name = newName  // userInfo 객체에 새 이름 할당
            }
            .store(in: &subscriptions)
    }
    
    private func setupAgeSubscription() {
        $userInfo
            .map { userInfo in
                Calendar.current.dateComponents([.year], from: userInfo.birthDate, to: Date()).year
            }
            .compactMap { $0 }
            .throttle(for: .seconds(1), scheduler: RunLoop.main, latest: true) // 0.5초 간격으로 throttle 적용
            .sink { [weak self] calculatedAge in
                self?.userInfo.age = calculatedAge
            }
            .store(in: &subscriptions)
    }
}

