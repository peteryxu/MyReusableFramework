//
//  ModelUtils.swift
//  MyReusableFramework
//
//  Created by Peter Xu on 11/21/18.
//  Copyright © 2018 We Sense Inc. All rights reserved.
//

import Foundation

public class ModelEncodeUtils {
    
    public static func  getJsonDecoder() -> JSONDecoder {
        enum DateError: String, Error {
            case invalidDate
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            
            // let formatter = DateFormatter()
            // formatter.calendar = Calendar(identifier: .iso8601)
            // formatter.locale = Locale(identifier: "en_US_POSIX")
            // formatter.timeZone = TimeZone(secondsFromGMT: 0)
            //  formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
            
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            
            if let date = formatter.date(from: dateStr) {
                return date
            }
            throw DateError.invalidDate
        })
        
        return decoder
    }
    
    public static func encodeModelAsJson<T: Encodable>(model: T) throws -> Data{
        var modelData = Data()
        let encoder = JSONEncoder()
        
        encoder.dateEncodingStrategy = .iso8601
        //encoder.dateEncodingStrategy =
        //encoder.keyEncodingStrategy
        encoder.outputFormatting = .prettyPrinted
        
        do {
            modelData = try encoder.encode(model)
            //print(modelData)
            if let modelString = String(data: modelData, encoding: .utf8) {
                print(modelString)
                
                //{"amount":12.119999885559082,"description":"fun","category":"fun","date":"2018-11-21T21:45:12Z"}
            }
        }catch {
            print("Error: cannot create JSON from transaction")
            
        }
        
        return modelData
    }
    
    
    public static func encodeModelAsPlistXML<T: Encodable>(model: T) throws -> Data{
        var modelData = Data()
        let encoder = PropertyListEncoder()
        
       encoder.outputFormat = .xml
        
        do {
            modelData = try encoder.encode(model)
            //print(modelData)
            if let modelString = String(data: modelData, encoding: .utf8) {
                print(modelString)
                
            }
        }catch {
            print("Error: cannot create XML from transaction")
            
        }
        
        return modelData
    }
    
}

