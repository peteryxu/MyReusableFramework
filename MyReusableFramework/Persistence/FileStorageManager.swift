//
//  FileStorageManager.swift
//  MyReusableFramework
//
//  Created by Peter Xu on 11/21/18.
//  Copyright © 2018 We Sense Inc. All rights reserved.
//

import Foundation

public class FileStorageManager {
    
    public static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        print(documentsDirectory.absoluteString)
        return documentsDirectory
    }
    
    //Save bytes array
    public static func save(_ fileName: String, _ contentData: Data) {
    
        let file = fileName //this is the file. we will write to and read from it
        
        //let text = "some text" //just a text
        
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
        
            //writing
            do {
                
                //try text.write(to: fileURL, atomically: false, encoding: .utf8)
                try contentData.write(to: fileURL, options: Data.WritingOptions.atomicWrite)
            }
            catch {/* error handling here */}
            
            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    
    }
    
      //Save text/string/json string
    public static func save(_ fileName: String, _ contentString: String) {
        
        let file = fileName //this is the file. we will write to and read from it
        
        let text = contentString //just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
            
            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
        
    }
    
   // Save images to the directory
   public static func saveImageDocumentDirectory(image: UIImage, imageName: String) {
        let fileManager = FileManager.default
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("yourProjectImages")
        if !fileManager.fileExists(atPath: path) {
            try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        let url = NSURL(string: path)
        let imagePath = url!.appendingPathComponent(imageName)
        let urlString: String = imagePath!.absoluteString
        let imageData = image.jpegData(compressionQuality: 0.5)
        //let imageData = UIImageJPEGRepresentation(image, 0.5)
        //let imageData = UIImagePNGRepresentation(image)
        fileManager.createFile(atPath: urlString as String, contents: imageData, attributes: nil)
    }
    
    //getting image from directory
    public static func getImageFromDocumentDirectory() {
        let fileManager = FileManager.default
        for i in 0...10 {
            let imagePath = (getDocumentsDirectory() as NSURL).appendingPathComponent("picked\(i).jpg")
            let urlString: String = imagePath!.absoluteString
            if fileManager.fileExists(atPath: urlString) {
                let image = UIImage(contentsOfFile: urlString)
                //imageArray.append(image!)
            } else {
                // print("No Image")
            }
        }
    }
    
    // Create Document Directory
    func configureDirectory() -> String {
        let fileManager = FileManager.default
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("yourProject")
        if !fileManager.fileExists(atPath: path) {
            try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        return path
    }
    
    // delete document directory to free space
    func deleteDirectory() {
        let fileManager = FileManager.default
        let yourProjectImagesPath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("yourProjectImages")
        if fileManager.fileExists(atPath: yourProjectImagesPath) {
            try! fileManager.removeItem(atPath: yourProjectImagesPath)
        }
        let yourProjectDirectoryPath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("yourProject")
        if fileManager.fileExists(atPath: yourProjectDirectoryPath) {
            try! fileManager.removeItem(atPath: yourProjectDirectoryPath)
        }
    }
    
    
}
