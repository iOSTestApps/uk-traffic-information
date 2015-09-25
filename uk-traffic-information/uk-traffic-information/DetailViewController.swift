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

    var selectedEvent: Event!
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        let region = MKCoordinateRegionMakeWithDistance(selectedEvent.location.coordinate, 1000 * 2.0, 1000 * 2.0)
        mapView.setRegion(region, animated: true)
        mapView.mapType = MKMapType.Hybrid
    }

}
