//
//  aaa.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import SwiftUI

struct TransactionListUIComponent: View {
    
    @Binding var viewModel: AccountViewModel
    
    var body: some View {
        List(viewModel.dataModel.transactions.reversed(), id: \.id) { transaction in
            let transictionId = Bool.random() ? transaction.id : UUID() // MARK: Simulate invalid value
            HStack(alignment: .center) {
                TransactionDescriptionUIComponent(viewModel: .constant(viewModel), transactionId: .constant(transictionId))
                Spacer()
                TransactionValueUIComponent(viewModel: .constant(viewModel), transactionId: .constant(transictionId))
            }
            .frame(maxWidth: .infinity)
            .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        }
        .listStyle(.plain)
    }
}

struct TransactionDescriptionUIComponent: View {
    
    @Binding var viewModel: AccountViewModel
    @Binding var transactionId: UUID
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.getTransactionTitle(withId: transactionId))
                .foregroundColor(viewModel.getTransactionTitleColor(withId: transactionId))
                .fontWeight(viewModel.getTransactionTitleFontWeight(withId: transactionId))
            Text(viewModel.getTransactionDescription(withId: transactionId))
        }
    }
}

struct TransactionValueUIComponent: View {
    
    @Binding var viewModel: AccountViewModel
    @Binding var transactionId: UUID
    
    var body: some View {
        HStack(spacing: .zero) {
            Text(viewModel.getTransactionValue(withId: transactionId))
                .fontWeight(viewModel.getTransactionValueFontWeight(withId: transactionId))
        }
    }
}

struct TransactionList_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListUIComponent(viewModel: .constant(AccountViewModel()))
    }
}
