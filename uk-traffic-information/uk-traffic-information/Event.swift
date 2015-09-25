//
//  Event.swift
//  uk-traffic-information
//
//  Created by Alex Chesters on 15/09/2015.
//  Copyright © 2015 Alex Chesters. All rights reserved.
//

import Foundation
import CoreLocation

public class Event {
    var category: String!
    var description: String!
    var road: String!
    var region: String!
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    
    init(category: String, description: String, road: String, region: String, latitude: String, longitude: String) {
        self.category = category
        self.description = description
        self.road = road
        self.region = region
        self.latitude = (latitude as NSString).doubleValue
        self.longitude = (longitude as NSString).doubleValue
    }
}