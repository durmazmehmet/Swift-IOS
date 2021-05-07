//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Kaan Aslan on 6.01.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ToDoItem : Encodable, Decodable {
    var contentText = ""
    var dateText = ""
    var checked = false
    
    init(_ contentText: String, _ dateText: String, _ checked: Bool)
    {
        self.contentText = contentText
        self.dateText = dateText
        self.checked = checked
    }
}
