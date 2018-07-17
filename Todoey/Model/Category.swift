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
    
    let items = List<Item>()
}
