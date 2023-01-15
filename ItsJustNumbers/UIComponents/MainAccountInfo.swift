//
//  MainAccountInfo.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import SwiftUI

struct MainAccountInfo: View {
    
    @Binding var account: AccountViewnModel
    
    
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
                        Text("\(account.getCurrency())")
                    }
                    HStack(){
                        Text("Level:")
                            .font(.system(size: 18, weight: .bold))
                        Text("\(account.model.level)")
                    }
                    HStack(){
                        Text("Experience:")
                            .font(.system(size: 18, weight: .bold))
                        Text("\(account.getExperience())")
                    }
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            }
        }
        .foregroundColor(.white)
        .background(.green)
    }
}

struct MainAccountInfo_Previews: PreviewProvider {
    static var previews: some View {
        VStack() {
            MainAccountInfo(
                account: .constant(AccountViewnModel())
            )
            Spacer()
        }
    }
}
