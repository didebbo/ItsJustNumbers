//
//  Account.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import Foundation

struct AccountModel {
    
    // MARK: ACCOUNT INFO
    
    var id: UUID
    var name: String
    var surname: String
    var username: String
    
    // MARK: PARAMETRICS INFO
    
    var currency: Double
    var level: Int
    var experience: Double
    
    // MARK: TRANSACTIONS INFO
    var transactions: [TransactionModel]
}


