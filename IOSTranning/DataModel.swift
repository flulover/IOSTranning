//
//  DataModel.swift
//  IOSTranning
//
//  Created by twer on 6/9/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class DataModel: NSObject {
    var title:String
    var items:NSMutableArray
    
    init(title:String){
        self.title = title
        items = NSMutableArray()
    }
}
