//
//  aaa.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import SwiftUI

struct TransactionListUIComponent: View {
    
    @Binding var account: AccountViewnModel
    
    var body: some View {
        List(account.model.transactions, id: \.id) { transaction in
            HStack() {
                VStack() {
                    Text(transaction.title)
                    Text(transaction.description)
                }
                HStack() {
                    Text(account.getTransactionValue(id: transaction.id, withUniform: true))
                }
            }
        }
    }
}

struct aaa_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListUIComponent(account: .constant(AccountViewnModel()))
    }
}
