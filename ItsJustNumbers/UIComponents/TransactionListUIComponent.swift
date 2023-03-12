//
//  aaa.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import SwiftUI

struct TransactionListUIComponent: View {
    
    @Binding var account: AccountModelObservableObject
    
    var body: some View {
        List(account.model.transactions.reversed(), id: \.id) { transaction in
            HStack(alignment: .center) {
                TransactionDescriptionUIComponent(transaction: .constant(transaction))
                Spacer()
                TransactionValueUIComponent(transaction: .constant(transaction))
            }
            .frame(maxWidth: .infinity)
            .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        }
        .listStyle(.plain)
    }
}

struct TransactionDescriptionUIComponent: View {
    
    @Binding var transaction: TransactionModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(transaction.title)
                .foregroundColor(transaction.type == .incoming ? .green : .red )
                .fontWeight(transaction.type == .incoming ? .bold : .regular)
            Text(transaction.description)
        }
    }
}

struct TransactionValueUIComponent: View {
    
    @Binding var transaction: TransactionModel
    
    var body: some View {
        HStack(spacing: .zero) {
            Text(getTransactionValue(transaction: transaction))
                .fontWeight(transaction.type == .incoming ? .bold : .regular)
        }
    }
    
    private func getTransactionValue(transaction: TransactionModel, withUniform: Bool = true ) -> String {
        var str = String(format: "%.2f", (transaction.value))
        if withUniform { str += "€" }
        return  str
    }
}

struct aaa_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListUIComponent(account: .constant(AccountModelObservableObject()))
    }
}
