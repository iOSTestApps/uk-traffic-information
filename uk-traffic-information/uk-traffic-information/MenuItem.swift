//
//  MenuItem.swift
//  uk-traffic-information
//
//  Created by Alex Chesters on 15/09/2015.
//  Copyright © 2015 Alex Chesters. All rights reserved.
//

import Foundation
import UIKit

public class MenuItem {
    var title: String!
    var viewController: UIViewController!
    
    init(title: String, viewController: UIViewController) {
        self.title = title
        self.viewController = viewController
    }
}