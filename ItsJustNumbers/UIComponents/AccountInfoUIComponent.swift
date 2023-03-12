//
//  MainAccountInfo.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import SwiftUI

struct MainAccountInfoUIComponent: View {
    
    @Binding var viewModel: AccountViewModel
    
    var body: some View {
        ZStack(){
            VStack() {
                VStack() {
                    Text("\(viewModel.dataModel.name) \(viewModel.dataModel.surname)")
                        .font(.system(size: 24, weight: .bold, design: .default))
                    Text("\(viewModel.dataModel.id)")
                        .font(.system(size: 12, weight: .bold))
                }
                VStack(alignment: .leading) {
                    HStack(){
                        Text("Currency:")
                            .font(.system(size: 18, weight: .bold))
                        Text(viewModel.getCurrency())
                    }
                    HStack(){
                        Text("Level:")
                            .font(.system(size: 18, weight: .bold))
                        Text("\(viewModel.dataModel.level)")
                    }
                    HStack(){
                        Text("Experience:")
                            .font(.system(size: 18, weight: .bold))
                        Text(viewModel.getExperience())
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundColor(.white)
        .background(.green)
    }
}

struct MainAccountInfo_Previews: PreviewProvider {
    static var previews: some View {
        VStack() {
            MainAccountInfoUIComponent(viewModel: .constant(AccountViewModel()))
            Spacer()
        }
    }
}
