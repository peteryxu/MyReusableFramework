//
//  FilePlistXMLManager.swift
//  MyReusableFramework
//
//  Created by Peter Xu on 11/21/18.
//  Copyright © 2018 We Sense Inc. All rights reserved.
//

import Foundation

public extension FileManager {
    // Returns a URL that points to the document folder of this playground.
    static var documentDirectoryURL: URL {
        return try! FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
    }
}

public class FilePlistXMLManager {

    public static func savePlist(_ dir: String, _ fileName: String, _ contentData: Data){
    
    //: Create a seperate folder that will contain your plist file containing your key/values.
    let documentSubdirectoryURL = URL(
        //fileURLWithPath: "MyPlistFolder",
        fileURLWithPath: dir,
        relativeTo: FileManager.documentDirectoryURL
    )
    try? FileManager.default.createDirectory(
        at: documentSubdirectoryURL,
        withIntermediateDirectories: false
    )
    
    // let plistURL = URL(fileURLWithPath: "myAPIKeys", relativeTo: FileManager.documentDirectoryURL.appendingPathComponent("MyPlistFolder")).appendingPathExtension("plist")
    
      let plistURL = URL(fileURLWithPath: fileName, relativeTo: FileManager.documentDirectoryURL.appendingPathComponent(dir)).appendingPathExtension("plist")
    
        do {
      try contentData.write(to: plistURL)
            
            /*:
             * Create an instance of PropertyListDecoder()
             * Fetch data from the plistURL
             * After that, decode your data by specifying the type of your data. Please note that we had created an array of keys and hence the type will be array of MyKey, i.e [MyKey].self
             * Bingo!
             */
            let plistDecoder = PropertyListDecoder()
            let data = try Data.init(contentsOf: plistURL)
            //let value = try plistDecoder.decode([MyKey].self, from: data)
            
        } catch {print(error)}
      
    
    }
    
}

