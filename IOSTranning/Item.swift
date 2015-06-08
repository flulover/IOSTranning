//
//  Item.swift
//  IOSTranning
//
//  Created by twer on 6/9/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class Item: NSObject {
    var title:String
    var itemDescription:String
    var imageHref:String
    
    init(title:String, description:String, imageHref:String){
        self.title = title
        self.itemDescription = description
        self.imageHref = imageHref
    }
}
