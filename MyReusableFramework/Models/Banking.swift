//
//  Account.swift
//  MyReusableFramework
//
//  Created by Peter Xu on 11/21/18.
//  Copyright © 2018 We Sense Inc. All rights reserved.
//

import Foundation

/*
 https://kristofk.com/swift-initializers-1/
 
 https://useyourloaf.com/blog/swift-codable-with-custom-dates/
 
 Default initializers are generated for you by Xcode. By default, Xcode generates memberwise initialization for you for each property with the properties’ names.
 
 Whenever you specify a custom initializer you override the default memberwise initializer.
 
 Alternatively, if you do not want to override the memberwise initializer then you can put all your custom initializers in anextension.
 */

public struct Account: Decodable {
    public var id = ""
    public var name: String
    public var bank: String
    public var transactions = [Transaction]()
    
    public var total: Decimal {
        return transactions.reduce(0.0, { $0 + $1.amount * ($1.category == .income ? 1 : -1) })
    }
    
    
    public init(id: String, name: String, bank: String) {
        self.id = id
        self.name = name
        self.bank = bank
        
        //self.transactions = [Transaction]()
        
    }
    
    /*
     Omit properties from the CodingKeys enumeration if they won't be present when decoding instances, or if certain properties shouldn't be included in an encoded representation. A property omitted from CodingKeys needs a default value in order for its containing type to receive automatic conformance to Decodable or Codable.
     */
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case bank
        //case transactions
    }
}

//minimla info needed when creatig account, encoding
public struct Account2: Encodable {
    let name: String
    let bank: String
    
    public init(name: String, bank: String) {
        self.name = name
        self.bank = bank
    }
}

public enum TransactionCategory: String, Codable {
    case income
    case groceries
    case utilities
    case home
    case transport
    case fun
}

/*
 [{"id":2,"amount":500,"description":"monthly for Oct","date":"2018-11-15T04:06:37.453Z","category":"income","accountId":1}]
 */
public struct Transaction: Decodable {
    public var id = ""
    public var amount: Decimal // In a real app that deals with money you should not use floating point numbers!
    public var description: String
    public var date: Date
    public var category: TransactionCategory
    public var accountId = ""
    
}

public struct Transaction2: Encodable {
    //transaction id won't be know during creation, and was supplied by backend
    //account id  is NOT in the payload,  included in the URI  if using AccountTransactionController
     //account id  in the payload,  included in the URI  if using TransactionController
    
    let amount: Decimal
    let description: String
    let date: Date
    let category: TransactionCategory
    
    public init(amount: Decimal, description: String, date: Date, category: TransactionCategory) {
        self.amount = amount
        self.description = description
        self.date = date
        self.category = category
        
        
    }
    enum CodingKeys: String, CodingKey {
        case amount
        case description
        case date
        case category
        
    }
}



