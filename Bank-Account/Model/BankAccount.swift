//
//  BankAccount.swift
//  Bank-Account
//
//  Created by Aya on 20/04/2025.
//

import Foundation

enum BankAccountError {
    case insufficentFunds
    case sameAccountTransfer
    case fruadAlert
    case invalidAmount
}

class BankAccount {
    let owner: String
    let accountNumber: String
    var balance: Double
    
    init(owner: String, accountNumber: String, balance: Double) {
        self.owner = owner
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    func deposite(_ amount: Double) {
        
    }
    
    func withdraw(_ amount: Double) {
        
    }
    
    func transfer(_ amount: Double, to account: BankAccount) {
        
    }
}
