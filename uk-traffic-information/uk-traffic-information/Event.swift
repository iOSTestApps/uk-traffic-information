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
    
    private var category: String!
    private var description: String!
    private var road: String!
    private var region: String!
    private var latitude: CLLocationDegrees!
    private var longitude: CLLocationDegrees!
    private var location: CLLocation!
    
    init(category: String, description: String, road: String, region: String, latitude: String, longitude: String) {
        self.category = category
        self.description = description
        self.road = road
        self.region = region
        self.latitude = (latitude as NSString).doubleValue
        self.longitude = (longitude as NSString).doubleValue
        self.location = CLLocation(latitude: self.latitude, longitude: self.longitude)
    }
    
    public func getCategory() -> String {
        return self.category
    }
    
    public func getDescription() -> String {
        return self.description
    }
    
    public func getRoad() -> String {
        return self.road
    }
    
    public func getRegion() -> String {
        return self.region
    }
    
    public func getLatitude() -> CLLocationDegrees {
        return self.latitude
    }
    
    public func getLongitude() -> CLLocationDegrees {
        return self.longitude
    }
    
    public func getLocation() -> CLLocation {
        return self.location
    }
    
}