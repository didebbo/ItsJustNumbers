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
        experience: 0,
        transactions: []
    )
    
    func getCurrency() -> String {
        String(format: "%.2f", model.currency)
    }
    
    func getExperience() -> String {
        String(String(format: "%.6f", model.experience).dropFirst(2))
    }
    
    func getTransactionValue(id: UUID, withUniform: Bool = true ) -> String {
        guard let value = model.transactions.first(where: {$0.id == id})?.value else { return "N/A" }
        var str = String(format: "%.2f", (value))
        if withUniform { str += "€" }
        return  str
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
