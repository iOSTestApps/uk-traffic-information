//
//  Rss.swift
//  RetroUnited
//
//  Created by Alex Chesters on 12/08/2015.
//  Copyright (c) 2015 Alex Chesters. All rights reserved.
//

import Foundation

/*
* Used to parse a URL of a RSS feed and return an array of events.
* @param {Function} callback - A callback function, this is the place to deal with the data returned from the RSS feed.
*/

public func RSSFeedParser(callback: (returnData: Array<Event>) -> ()) {
    
    var returnData = [Event]()
    
    let request: NSURLRequest = NSURLRequest(URL: NSURL(string: "http://m.highways.gov.uk/feeds/rss/AllEvents.xml")!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 12.0)
    
    RSSParser.parseFeedForRequest(request, callback: { (feed, error) -> Void in
        if let data = feed {
            for (var i = 0; i < data.items.count; i++) {
                
                var category: String!
                var description: String!
                var road: String!
                var region: String!
                var latitude: String!
                var longitude: String!
                
                category = data.items[i].categories[0]
                description = data.items[i].itemDescription
                road = data.items[i].road
                region = data.items[i].region
                latitude = data.items[i].latitude
                longitude = data.items[i].longitude
                
                returnData.append(Event(category: category, description: description, road: road, region: region, latitude: latitude, longitude: longitude))
            }
        } else {
            callback(returnData: [])
        }
        callback(returnData: returnData)
    })
}

private func decodeURLComponentsInString(string: String) -> String {
    var decodedString = string
    do {
        let htmlRegex: NSRegularExpression = try NSRegularExpression(pattern: "<.*?>", options: NSRegularExpressionOptions.CaseInsensitive)
        decodedString = htmlRegex.stringByReplacingMatchesInString(decodedString, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, decodedString.characters.count), withTemplate: "")
        decodedString = decodedString.stringByReplacingOccurrencesOfString("View image | gettyimages.com", withString: "")
        decodedString = decodedString.stringByReplacingOccurrencesOfString("&#8217;", withString: "'")
        decodedString = decodedString.stringByReplacingOccurrencesOfString("&#8216;", withString: "'")
        decodedString = decodedString.stringByReplacingOccurrencesOfString("&#8220;", withString: "\"")
        decodedString = decodedString.stringByReplacingOccurrencesOfString("&#8221;", withString: "\"")
        decodedString = decodedString.stringByReplacingOccurrencesOfString("&#8243;", withString: "\"")
        decodedString = decodedString.stringByReplacingOccurrencesOfString("&#8211;", withString: "-")
        decodedString = decodedString.stringByReplacingOccurrencesOfString("&#8230;", withString: "...")
        decodedString = decodedString.stringByReplacingOccurrencesOfString("&#038;", withString: "&")
        decodedString = decodedString.stringByReplacingOccurrencesOfString("&nbsp;", withString: "\n")
    } catch {
        
    }
    return decodedString
}