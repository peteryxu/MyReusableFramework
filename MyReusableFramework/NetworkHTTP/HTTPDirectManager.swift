//
//  HTTPLB4Manager.swift
//  MyReusableFramework
//
//  Created by Peter Xu on 11/22/18.
//  Copyright © 2018 We Sense Inc. All rights reserved.
//

import Foundation

public class HTTPDirectManager {
    
    public static func queryTest(address: String) -> String {
        let url = URL(string: address)
        let semaphore = DispatchSemaphore(value: 0)
        var responseString: String = ""
        let urlRequest = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            responseString = String(data: data!, encoding: String.Encoding.utf8)!
            print(responseString)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        return responseString
    }
    
    public static func query(address: String) -> Data {
        let url = URL(string: address)
        let semaphore = DispatchSemaphore(value: 0)
        
        //Creates an empty data buffer.
        var responseData = Data()
        
        let urlRequest = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            responseData = data!
            print(responseData)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        return responseData
    }
    
    public static func postTest(address: String, body:String) -> String {
        
        let headers =
            ["Content-Type": "application/json;charset=UTF-8",  //from the consumes section
                "Accept": "application/json" //from produces section
        ]
        
        let url = URL(string: address)
        let semaphore = DispatchSemaphore(value: 0)
        
        var responseString: String = ""
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = body.data(using: .utf8)
        urlRequest.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            responseString = String(data: data!, encoding: String.Encoding.utf8)!
            print(responseString)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return responseString
       
    }
    
    public static func post(address: String, body:Data) -> Data {
        
        let headers =
            ["Content-Type": "application/json;charset=UTF-8",  //from the consumes section
                "Accept": "application/json" //from produces section
        ]
        
        let url = URL(string: address)
        let semaphore = DispatchSemaphore(value: 0)
        
        //Creates an empty data buffer.
        var responseData = Data()
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = body
        urlRequest.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            responseData = data!
            print(responseData)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        return responseData
    }
    
}
