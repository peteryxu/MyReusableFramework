//
//  StateController4Rest.swift
//  Banking
//
//  Created by Peter Xu on 11/16/18.
//  Copyright © 2018 Pure Creek. All rights reserved.
//

import Foundation
import MyReusableFramework

class StateController {
    
    //fileprivate let apiController: APIController
    static let shared = StateController()
    
    public var accounts = [Account]()
    //var transactions: [Transaction]
    
    private init() {
        do {
        print("init StateController")
        let getAccountsResponseData = HTTPDirectManager.query(address: "http://127.0.0.1:3000/accounts")
        self.accounts = try ModelEncodeUtils.getJsonDecoder().decode([Account].self, from: getAccountsResponseData)
        print(self.accounts)
        } catch { print("Unexpected error: \(error)")}
    
    }
    
    func getAccounts() -> [Account] {
        return self.accounts
    }
    
    
    //Acounts related
    func addAccount(_ account: Account) {
        
        do {
        //accounts.append(account)
        
        let acct2 = Account2(name: account.name, bank: account.bank)
         let requestData = try ModelEncodeUtils.encodeModelAsJson(model: acct2)
         let responseData = HTTPDirectManager.post(address: "http://127.0.0.1:3000/accounts", body: requestData)
         let createdAcct = try ModelEncodeUtils.getJsonDecoder().decode(Account.self, from: responseData)
         accounts.append(createdAcct)
         let createdAcctNumber = createdAcct.number
         print(createdAcctNumber)
        } catch {}
    }
    
    func updateAccount(_ account: Account) {
        for (index, storedAccount) in accounts.enumerated() {
            guard storedAccount.number == account.number else {
                continue
            }
            accounts[index] = account
            let url = "http://127.0.0.1:3000/accounts/"+String(account.number)
            let patchAccountData = "{\"name\":\"acct1616\"}".data(using: .utf8)!
            let patchAccountStatus = HTTPDirectManager.patch(address: url, body: patchAccountData)
            break
        }
    }
    
    func deleteAccount(_ account: Account) {
        for (index, storedAccount) in accounts.enumerated() {
            guard storedAccount.number == account.number else {
                continue
            }
        accounts.remove(at: index)
        let url = "http://127.0.0.1:3000/accounts/"+String(account.number)
        let deleteAccountStatus = HTTPDirectManager.delete(address: url)
            break
        }
    }
    
    
    
    //Transactions related
    func fetchTransactions(_ accountId: Int) {
        do {
        let url = "http://127.0.0.1:3000/accounts/"+String(accountId)+"/transactions"
        let getTransactionsByAcctResponseData = HTTPDirectManager.query(address: url)
            
        for (index, storedAccount) in accounts.enumerated() {
                guard storedAccount.number == accountId else {
                    continue
        }
            
        self.accounts[index].transactions = try ModelEncodeUtils.getJsonDecoder().decode([Transaction].self, from: getTransactionsByAcctResponseData)
            }
        
        print("StateController after fetching transactons for account \(accountId) are \(self.accounts)")
        } catch {}
    
    }
    
    
    func addTransaction(_ transaction: Transaction2, _ accountId: Int) {
        //accounts[selectedIndex].transactions.append(transaction)
        //apiController.saveTransaction(transaction)
        
        /*let trans2 = Transaction2(amount: Decimal(125.99).roundedCurrency, description: "I love spending", date: Date(), category: .home)
         let requestData = ModelEncodeUtils.encodeModelAsJson(model: trans2)
         let responseData = HTTPDirectManager.post(address: "http://127.0.0.1:3000/accounts/3/transactions", body: requestData)
         let createdTrans = ModelEncodeUtils.getJsonDecoder().decode(Transaction.self, from: responseData)
         //let createdTransId = createdTrans
         print(createdTrans) */
        
        do {
             let url = "http://127.0.0.1:3000/accounts/"+String(accountId)+"/transactions"
            let requestData = try ModelEncodeUtils.encodeModelAsJson(model: transaction)
            let responseData = HTTPDirectManager.post(address: url, body: requestData)
            let createdTrans = try ModelEncodeUtils.getJsonDecoder().decode(Transaction.self, from: responseData)
            
            for (index, storedAccount) in accounts.enumerated() {
                guard storedAccount.number == accountId else {
                    continue
                }
              accounts[index].transactions.append(createdTrans)
            }
           
                
        } catch {}
        
    }
    
    
}
