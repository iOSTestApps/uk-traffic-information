//
//  MapViewController.swift
//  uk-traffic-information
//
//  Created by Alex Chesters on 29/09/2015.
//  Copyright © 2015 Alex Chesters. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, ENSideMenuDelegate, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: UIBarButtonItemStyle.Plain, target: self, action: "toggleSideMenu")
    }
    
    func toggleSideMenu() {
        toggleSideMenuView()
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuShouldOpenSideMenu() -> Bool {
        return true
    }

}
