//
//  TodoModel.swift
//  TodoList
//
//  Created by Suriel.S on 3/28/15.
//  Copyright (c) 2015 ShallowSleep. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var id: String
    var image: String
    var title: String
    var date: NSDate
    
    init(id: String, image: String, title: String, date: NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}

//struct TodoModel2 {
//    var id: String
//    var image: String
//    var title: String
//    var date: NSDate
//}
