//
//  ContentView.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import SwiftUI

struct GlobalView: View {
    
    @StateObject var account = AccountViewModel()
    
    var body: some View {
        VStack() {
            MainAccountInfoUIComponent(account: .constant(account))
            TransactionListUIComponent(account: .constant(account))
                .padding(.vertical)
            DebugTools(account: .constant(account))
        }
    }
}

struct DebugTools: View {
    
    @Binding var account: AccountViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            HStack() {
                DebugButton(
                    text: .constant("Add Transaction"),
                    action: .constant(account.addRandomTransaction)
                )
                Spacer()
                DebugButton(
                    text: .constant("Add Experience"),
                    action: .constant(account.addExperience)
                )
            }
            .padding(.horizontal)
        }
    }
    
    struct DebugButton: View {
        
        @Binding var text: String
        @Binding var action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Text(text)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalView()
    }
}
