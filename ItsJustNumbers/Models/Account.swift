//
//  Account.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import Foundation

struct Account {
    
    var id: UUID
    var name: String
    var surname: String
    var username: String
    var currency: Double
    var level: Int
    var experience: Double
}

class AccountViewnModel: ObservableObject {
    
    @Published private(set) var model: Account = Account(
        id: UUID(),
        name: "Mario",
        surname: "Rossini",
        username: "MarioRossini",
        currency: 0,
        level: 0,
        experience: 0
    )
    
    func getCurrency() -> String {
        String(format: "%.2f", model.currency)
    }
    
    func getExperience() -> String {
        String(String(format: "%.6f", model.experience).dropFirst(2))
    }
    
    func addCurrency() {
        model.currency += 1 / Double.random(in: 0...100)
    }
    
    func addExperience() {
        model.experience += 1 / Double.random(in: 0...100)
        model.level = Int(model.experience)
    }
}


