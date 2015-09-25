//
//  DetailViewController.swift
//  uk-traffic-information
//
//  Created by Alex Chesters on 26/09/2015.
//  Copyright © 2015 Alex Chesters. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.mapType = MKMapType.Hybrid
    }

}
