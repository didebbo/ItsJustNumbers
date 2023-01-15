//
//  TransactionModel.swift
//  ItsJustNumbers
//
//  Created by MC Engineering on 15/01/23.
//

import Foundation
import SwiftUI

struct TransactionModel {
    
    var id: UUID
    var title: String {
        type.placeholder_Title
    }
    var description: String {
        type.placeholder_Description
    }
    var value: Double
    var type: TransactionType
    
    enum TransactionType: CaseIterable {
        case incoming
        case outcoming
        
        var placeholder_Title: String {
            switch self {
                case .incoming:
                    return "In Entrata"
                case .outcoming:
                    return "In Uscita"
            }
        }
        
        var placeholder_Description: String {
            switch self {
                case .incoming:
                    return "Hai ricevuto del denaro"
                case .outcoming:
                    return "Hai effettuato un pagato"
            }
        }
    }
}
