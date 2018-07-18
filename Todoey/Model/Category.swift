//
//  Category.swift
//  Todoey
//
//  Created by Arjun Singh on 17/07/18.
//  Copyright © 2018 Arjun Singh. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var cellBackgroundColour: String = UIColor.flatWhite.hexValue()
    
    let items = List<Item>()
}
