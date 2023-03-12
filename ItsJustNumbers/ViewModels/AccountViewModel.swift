//
//  AccountViewModel.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import Foundation
import SwiftUI

class AccountViewModel: ObservableObject {
    
    @Published private(set) var dataModel: AccountModel = AccountModel(
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
        String(format: "%.2f", dataModel.currency)
    }
    
    func getExperience() -> String {
        String(String(format: "%.6f", dataModel.experience).dropFirst(2))
    }
    
    func getTransaction(withId: UUID) -> TransactionModel? {
        dataModel.transactions.first(where: {$0.id == withId})
    }
    
    func getTransactionType(withId: UUID) -> TransactionModel.TransactionType {
        getTransaction(withId: withId)?.type ?? .na
    }
    
    func getTransactionTitle(withId: UUID) -> String {
        getTransaction(withId: withId)?.title ?? "--"
    }
    
    func getTransactionDescription(withId: UUID) -> String {
        getTransaction(withId: withId)?.description ?? "--"
    }
    
    func getTransactionTitleColor(withId: UUID) -> Color {
        switch getTransactionType(withId: withId) {
            case .incoming:
                return .green
            case .outcoming:
                return .red
            default:
                return .black
        }
    }
    
    func getTransactionTitleFontWeight(withId: UUID) -> Font.Weight {
        switch getTransactionType(withId: withId) {
            case .incoming:
                return .bold
            case .outcoming:
                return .regular
            default:
                return .bold
        }
    }
    
    func getTransactionValue(withId: UUID, withUniform: Bool = true ) -> String {
        guard let value = getTransaction(withId: withId)?.value else { return "N/A" }
        var str = String(format: "%.2f", (value))
        if withUniform { str += "€" }
        return  str
    }
    
    func getTransactionValueFontWeight(withId: UUID) -> Font.Weight {
        switch getTransactionType(withId: withId) {
            case .incoming:
                return .bold
            case .outcoming:
                return .regular
            default:
                return .bold
        }
    }
    
    func addCurrency() {
        let addValue = 1 / Double.random(in: 0...100)
        dataModel.transactions.append(
            TransactionModel(
                id: UUID(),
                value: addValue,
                type: .incoming
            )
        )
        dataModel.currency += addValue
    }
    
    func removeCurrency() {
        let removeValue = 1 / Double.random(in: 0...100)
        dataModel.transactions.append(
            TransactionModel(
                id: UUID(),
                value: -removeValue,
                type: .outcoming
            )
        )
        dataModel.currency -= removeValue
    }
    
    func addRandomTransaction() {
        if(Bool.random()) {
            addCurrency()
        } else {
            removeCurrency()
        }
    }
    
    func addExperience() {
        dataModel.experience += 1 / Double.random(in: 0...100)
        dataModel.level = Int(dataModel.experience)
    }
}
