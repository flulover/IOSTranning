//
//  JSONParser.swift
//  IOSTranning
//
//  Created by twer on 6/9/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class JSONParser: NSObject {
    func loadJSONFile()->JSON{
        let path = NSBundle.mainBundle().pathForResource("facts", ofType: "json")
        let data:NSData = NSData.dataWithContentsOfMappedFile(path!) as! NSData
        return JSON(data: data)
    }
}
