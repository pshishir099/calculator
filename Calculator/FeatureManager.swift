//
//  FeatureManager.swift
//  Calculator
//
//  Created by Shishir P on 16/12/17.
//  Copyright © 2017 Shishir P. All rights reserved.
//

import UIKit

class FeatureManager: NSObject {
    var rootDictionary:[String:Any] = [String: AnyObject]()
    var plistPath : String?
    
    override init() {
        super.init()
        self.rootDictionary = getRootDictionary()
        
        
            
    }
    
    func getRootDictionary() -> [String: Any] {
        preparePlistForUse()
        var somedict:[String:Any] = [String: AnyObject]()
        let data : Data =  FileManager.default.contents(atPath: plistPath!)!
        // Convert the NSData to mutable array
        do{
            
            somedict = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String: AnyObject]
            
            somedict.updateValue("Shishir" as AnyObject, forKey: "name")
            // Save to plist

            addValuesToPlistFile(dictionary: somedict as NSDictionary)
        }catch{
            print("An error occurred while writing to plist")
            
        }
        
        return somedict
    }
    
    func addValuesToPlistFile(dictionary:NSDictionary) {
       dictionary.write(toFile: plistPath!, atomically: false)
    }
    
    func preparePlistForUse(){
        let rootPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true)[0]
        plistPath = rootPath + "/customData.plist"
//        plistPath = rootPath.stringByAppendingString("/customData.plist")
        
        if !FileManager.default.fileExists(atPath: plistPath!) {
            
            let plistPathInBundle = Bundle.main.path(forResource: "customData", ofType: "plist")
        
            do {
                try FileManager.default.copyItem(atPath: plistPathInBundle!, toPath: plistPath!)
            } catch {
                print("Error occurred while copying file to document \(error)")
            }
        }
        
    }

}
