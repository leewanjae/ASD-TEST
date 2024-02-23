//
//  UserInfo.swift
//
//
//  Created by 이완재 on 2/5/24.
//

import Foundation

class UserInfo: ObservableObject {
    @Published var id: UUID = UUID()
    @Published var name: String = "Name" {
        didSet {
            UserDefaults.standard.set(name, forKey: "userName")
        }
    }
    @Published var birthDate: Date {
        didSet {
            UserDefaults.standard.set(birthDate, forKey: "userBirthDate")
        }
    }
    
    init() {
        self.name = UserDefaults.standard.string(forKey: "userName") ?? "Name"
        self.birthDate = UserDefaults.standard.object(forKey: "userBirthDate") as? Date ?? Date()
    }
    
    var age: Int {
        Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year ?? 0
    }
    
    func reset() {
        self.name = ""
        self.birthDate = Date()
    }
}
