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
        transactions: {
            var transactions: [TransactionModel] = []
            for _ in 1...2 {
                transactions.append(
                    TransactionModel(
                        id: UUID(),
                        title: "",
                        description: "",
                        value: Double.random(in: 0.1...5),
                        type: Bool.random() ? TransactionModel.TransactionType.incoming : TransactionModel.TransactionType.outcoming
                    )
                )
            }
            return transactions.map { transaction in
                var newTransaction = transaction
                newTransaction.title = transaction.type.placeholder_Title
                newTransaction.description = transaction.type.placeholder_Description
                return newTransaction
            }
        }()
    )
    
    func getCurrency() -> String {
        String(format: "%.2f", model.currency)
    }
    
    func getExperience() -> String {
        String(String(format: "%.6f", model.experience).dropFirst(2))
    }
    
    func getTransactionValue(id: UUID, withUniform: Bool ) -> String {
        guard let value = model.transactions.first(where: {$0.id == id})?.value else { return "NA" }
        var str = String(format: "%.2f", (value))
        if withUniform { str += "€" }
        return  str
    }
    
    func addCurrency() {
        model.currency += 1 / Double.random(in: 0...100)
    }
    
    func addExperience() {
        model.experience += 1 / Double.random(in: 0...100)
        model.level = Int(model.experience)
    }
}
