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
    public var transDictionary = [String: [Transaction]]()

    private let  host = "http://127.0.0.1:3000"
    
    //var transactions: [Transaction]
    
    private init() {
        do {
        print("init StateController")
        let getAccountsResponseData = HTTPDirectManager.query(address: host+"/accounts")
        self.accounts = try ModelEncodeUtils.getJsonDecoder().decode([Account].self, from: getAccountsResponseData)
        print(self.accounts)
        } catch { print("Unexpected error: \(error)")}
    
    }
    
    func getAccounts() -> [Account] {
        return self.accounts
    }
    
    
    //Acounts related
    func addAccount(_ account: Account2) {
        
        do {
        //accounts.append(account)
        
        //let acct2 = Account2(name: account.name, bank: account.bank)
         let requestData = try ModelEncodeUtils.encodeModelAsJson(model: account)
         let responseData = HTTPDirectManager.post(address: host+"/accounts", body: requestData)
         let createdAcct = try ModelEncodeUtils.getJsonDecoder().decode(Account.self, from: responseData)
         accounts.append(createdAcct)
         let createdAcctNumber = createdAcct.id
         print(createdAcctNumber)
        } catch {}
    }
    
    func updateAccount(_ account: Account) {
        for (index, storedAccount) in accounts.enumerated() {
            guard storedAccount.id == account.id else {
                continue
            }
            accounts[index] = account
            let url = host+"/accounts/"+account.id
            let patchAccountData = "{\"name\":\"acct1616\"}".data(using: .utf8)!
            let patchAccountStatus = HTTPDirectManager.patch(address: url, body: patchAccountData)
            break
        }
    }
    
    func deleteAccount(_ account: Account) {
        for (index, storedAccount) in accounts.enumerated() {
            guard storedAccount.id == account.id else {
                continue
            }
        accounts.remove(at: index)
        let url = host+"/accounts/"+account.id
        let deleteAccountStatus = HTTPDirectManager.delete(address: url)
            break
        }
    }
    
    
    
    //Transactions related
    func fetchTransactions(_ accountId: String) {
        do {
        let url = host+"/accounts/"+accountId+"/transactions"
        print(url)
         let getTransactionsByAcctResponseString = HTTPDirectManager.queryTest(address: url)
        print(getTransactionsByAcctResponseString)
            
        let getTransactionsByAcctResponseData = HTTPDirectManager.query(address: url)
         
        //print(getTransactionsByAcctResponseData)
        /*for (index, storedAccount) in accounts.enumerated() {
                guard storedAccount.id == accountId else {
                    continue
             } }*/
            
            
        let trans = try ModelEncodeUtils.getJsonDecoder().decode([Transaction].self, from: getTransactionsByAcctResponseData)
        
       // print(trans[0].id)
        transDictionary[accountId] = trans
        print("StateController after fetching transactons for account")
        } catch { print("Unexpected error: \(error)")}
    
    }
    
    
    func addTransaction(_ transaction: Transaction2, _ accountId: String) {
        //accounts[selectedIndex].transactions.append(transaction)
        //apiController.saveTransaction(transaction)
        
        /*let trans2 = Transaction2(amount: Decimal(125.99).roundedCurrency, description: "I love spending", date: Date(), category: .home)
         let requestData = ModelEncodeUtils.encodeModelAsJson(model: trans2)
         let responseData = HTTPDirectManager.post(address: "http://127.0.0.1:3000/accounts/3/transactions", body: requestData)
         let createdTrans = ModelEncodeUtils.getJsonDecoder().decode(Transaction.self, from: responseData)
         //let createdTransId = createdTrans
         print(createdTrans) */
        
        do {
             let url = host+"/accounts/"+accountId+"/transactions"
            let requestData = try ModelEncodeUtils.encodeModelAsJson(model: transaction)
            let responseData = HTTPDirectManager.post(address: url, body: requestData)
            let createdTrans = try ModelEncodeUtils.getJsonDecoder().decode(Transaction.self, from: responseData)
            
            for (index, storedAccount) in accounts.enumerated() {
                guard storedAccount.id == accountId else {
                    continue
                }
              accounts[index].transactions.append(createdTrans)
            }
           
                
        } catch {}
        
    }
    
    
}
