//
//  BankAccount.swift
//  Bank-Account
//
//  Created by Aya on 20/04/2025.
//

import Foundation

enum BankAccountError: Error {
    case insufficentFunds
    case sameAccountTransfer
    case fruadAlert
    case invalidAmount
}

class BankAccount {
    let owner: String
    let accountNumber: String
    var balance: Double
    
    private let fruadThreshold: Double = 5000
    
    init(owner: String, accountNumber: String, balance: Double) {
        self.owner = owner
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    func deposite(_ amount: Double) throws {
        guard amount > 0 else { throw BankAccountError.invalidAmount }
        balance += amount
    }
    
    func withdraw(_ amount: Double) throws {
        guard amount > 0 else { throw BankAccountError.invalidAmount }
        if balance - amount < 0 { throw BankAccountError.insufficentFunds }
        if amount >= fruadThreshold { throw BankAccountError.fruadAlert }
        balance -= amount
    }
    
    func transfer(_ amount: Double, to receiverAccount: BankAccount) throws {
        guard accountNumber != receiverAccount.accountNumber else {
            throw BankAccountError.sameAccountTransfer
        }
        try self.withdraw(amount)
        try receiverAccount.deposite(amount)
    }
}
