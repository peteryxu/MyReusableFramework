//
//  Model.swift
//  MyReusableFramework
//
//  Created by Peter Xu on 11/21/18.
//  Copyright © 2018 We Sense Inc. All rights reserved.
//

import Foundation

fileprivate let currencyBehavior = NSDecimalNumberHandler(roundingMode: .bankers, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)

public extension Decimal {
    var roundedCurrency: Decimal {
        return (self as NSDecimalNumber).rounding(accordingToBehavior: currencyBehavior) as Decimal
    }
}



public struct Person: Codable {
    let name: String
    let gender: String
    let age: Int
    let profilePictures: [String: String]
    
    public init(name: String,
         gender: String,
         age: Int,
         profilePictures: [String:String])
    {
        self.name = name
        self.gender = gender
        self.age = age
        self.profilePictures = profilePictures
    }
}

public struct Recipe {
    var name:String
    var author:String
    var url:URL
    var yield:Int
    var ingredients:[String]
    var instructions:String
}

//: Create a Struct MyKey which conforms to `Codable` Protocol.
public enum Social: String, Codable {
    case twitter, facebook
}
public struct MyKey: Codable {

    public let apiKeyName: String
    public let apiKeyValue: String
    public let keyType: Social
    
    public init(keyName: String, keyValue: String, type: Social) {
        self.apiKeyName =  keyName
        self.apiKeyValue = keyValue
        self.keyType = type
    }
    
}

//Encode and Decode Manually
//https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types

struct Coordinate {
    var latitude: Double
    var longitude: Double
    var elevation: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case additionalInfo
    }
    
    enum AdditionalInfoKeys: String, CodingKey {
        case elevation
    }
}

extension Coordinate: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decode(Double.self, forKey: .latitude)
        longitude = try values.decode(Double.self, forKey: .longitude)
        
        let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
        elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
    }
}

extension Coordinate: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        
        var additionalInfo = container.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
        try additionalInfo.encode(elevation, forKey: .elevation)
    }
}


