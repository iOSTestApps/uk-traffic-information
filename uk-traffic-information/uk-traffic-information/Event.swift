//
//  Event.swift
//  uk-traffic-information
//
//  Created by Alex Chesters on 15/09/2015.
//  Copyright © 2015 Alex Chesters. All rights reserved.
//

import Foundation

public class Event {
    var category: String!
    var description: String!
    
    init(category: String, description: String) {
        self.category = category
        self.description = description
    }
}