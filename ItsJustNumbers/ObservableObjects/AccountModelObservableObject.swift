//
//  AccountModelObservableObject.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import Foundation

class AccountModelObservableObject: ObservableObject {
    
    @Published private(set) var model: AccountModel = AccountModel(
        id: UUID(),
        name: "Mario",
        surname: "Rossi",
        username: "Mario Rossi",
        currency: 0,
        level: 0,
        experience: 0,
        transactions: []
    )
    
    func getCurrency() -> String {
        String(format: "%.2f", model.currency)
    }
    
    func addCurrency() {
        let addValue = 1 / Double.random(in: 0...100)
        model.transactions.append(
            TransactionModel(
                id: UUID(),
                value: addValue,
                type: .incoming
            )
        )
        model.currency += addValue
    }
    
    func removeCurrency() {
        let removeValue = 1 / Double.random(in: 0...100)
        model.transactions.append(
            TransactionModel(
                id: UUID(),
                value: -removeValue,
                type: .outcoming
            )
        )
        model.currency -= removeValue
    }
    
    func addRandomTransaction() {
        if(Bool.random()) {
            addCurrency()
        } else {
            removeCurrency()
        }
    }
    
    func addExperience() {
        model.experience += 1 / Double.random(in: 0...100)
        model.level = Int(model.experience)
    }
}
