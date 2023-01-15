//
//  AccountViewModel.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import Foundation

class AccountViewnModel: ObservableObject {
    
    @Published private(set) var model: AccountModel = AccountModel(
        id: UUID(),
        name: "Mario",
        surname: "Rossi",
        username: "Mario Rossi",
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
