//
//  MenuItemTests.swift
//  uk-traffic-information
//
//  Created by Alex Chesters on 07/10/2015.
//  Copyright © 2015 Alex Chesters. All rights reserved.
//

import XCTest
@testable import uk_traffic_information

class MenuItemTests: XCTestCase {
    
    func testMenuItemSetsPropertiesCorrectly() {
        let mockViewController = UIViewController()
        let mockTitle = "foobar"
        let mockMenuItem = MenuItem(title: mockTitle, viewController: mockViewController)
        XCTAssertEqual(mockMenuItem.getTitle(), mockTitle)
        XCTAssertEqual(mockMenuItem.getViewController(), mockViewController)
    }
    
}
