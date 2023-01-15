//
//  ContentView.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var account = AccountViewnModel()
    
    var body: some View {
        VStack() {
            MainAccountInfo(account: .constant(account))
            Button("Aumenta Currency") {
                account.addCurrency()
            }
            Button("Aumenta Experience") {
                account.addExperience()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
