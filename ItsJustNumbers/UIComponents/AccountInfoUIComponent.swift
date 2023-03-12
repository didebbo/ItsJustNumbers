//
//  MainAccountInfo.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import SwiftUI

struct MainAccountInfoUIComponent: View {
    
    @Binding var account: AccountModelObservableObject
    
    var body: some View {
        ZStack(){
            VStack() {
                VStack() {
                    Text("\(account.model.name) \(account.model.surname)")
                        .font(.system(size: 24, weight: .bold, design: .default))
                    Text("\(account.model.id)")
                        .font(.system(size: 12, weight: .bold))
                }
                VStack(alignment: .leading) {
                    HStack(){
                        Text("Currency:")
                            .font(.system(size: 18, weight: .bold))
                        Text(account.getCurrency())
                    }
                    HStack(){
                        Text("Level:")
                            .font(.system(size: 18, weight: .bold))
                        Text("\(account.model.level)")
                    }
                    HStack(){
                        Text("Experience:")
                            .font(.system(size: 18, weight: .bold))
                        Text(getExperience(account: account))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundColor(.white)
        .background(.green)
    }
    
    func getExperience(account: AccountModelObservableObject) -> String {
        String(String(format: "%.6f", account.model.experience).dropFirst(2))
    }
}

struct MainAccountInfo_Previews: PreviewProvider {
    static var previews: some View {
        VStack() {
            MainAccountInfoUIComponent(
                account: .constant(AccountModelObservableObject())
            )
            Spacer()
        }
    }
}
