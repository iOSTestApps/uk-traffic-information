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
    var road: String!
    var region: String!
    
    init(category: String, description: String, road: String, region: String) {
        self.category = category
        self.description = description
        self.road = road
        self.region = region
    }
}