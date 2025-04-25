//
//  Bank_AccountTests.swift
//  Bank-AccountTests
//
//  Created by Aya on 25/04/2025.
//

import Testing
@testable import Bank_Account

struct Bank_AccountTests {
    
    @Test func testInitBankAccount() {
        let account = BankAccount(owner: "A", accountNumber: "123", balance: 1000)
        #expect(account.owner == "A")
        #expect(account.balance == 1000)
        #expect(account.accountNumber == "123")
    }
    
    @Test func testDepositeSuccess() throws {
        let account = BankAccount(owner: "A", accountNumber: "123", balance: 1000)
        try account.deposite(5000)
        #expect(account.balance == 6000)
    }
    
    @Test func testInvalidDepositAmount() {
        let account = BankAccount(owner: "A", accountNumber: "123", balance: 1000)
        
        #expect(throws: BankAccountError.invalidAmount) {
            try account.deposite(-100)
        }
        
    }
    
    @Test func testWithdrawSuccess() throws {
        let account = BankAccount(owner: "A", accountNumber: "123", balance: 1000)
        
        try account.withdraw(100)
        #expect(account.balance == 900)
        
    }
    
    @Test func testInvalidWithdraw() {
        let account = BankAccount(owner: "A", accountNumber: "123", balance: 1000)
        
        #expect(throws: BankAccountError.insufficentFunds) {
            try account.withdraw(1500)
        }
    }
    
    @Test func testWithdawrFraud() {
        let account = BankAccount(owner: "A", accountNumber: "123", balance: 10000)
        
        #expect(throws: BankAccountError.fruadAlert) {
            try account.withdraw(6000)
        }
    }
    
    @Test func testTransferSuccess() throws {
        let accountA = BankAccount(owner: "A", accountNumber: "123", balance: 1000)
        let accountB = BankAccount(owner: "B", accountNumber: "345", balance: 1000)
        try accountA.transfer(500, to: accountB)
        #expect(accountA.balance == 500)
        #expect(accountB.balance == 1500)
        
        
    }
    
    @Test func testSameAccountTransfer() {
        let account = BankAccount(owner: "A", accountNumber: "123", balance: 1000)
        
        #expect(throws: BankAccountError.sameAccountTransfer) {
            try account.transfer(600, to: account)
        }
    }
    
    @Test func testTrnasferWithInsufficentFunds() {
        let accountA = BankAccount(owner: "A", accountNumber: "123", balance: 1000)
        let accountB = BankAccount(owner: "B", accountNumber: "345", balance: 1000)

        #expect(throws: BankAccountError.insufficentFunds) {
            try accountA.transfer(2000, to: accountB)
        }
    }
    
}
