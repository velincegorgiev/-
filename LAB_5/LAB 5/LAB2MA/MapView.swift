//
//  MapView.swift
//  LAB2MA
//
//  Created by David Atanasoski on 16.9.23.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapView:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        map.showsUserLocation = true
        
        let coordinate = CLLocationCoordinate2D(latitude: 41.63830225965357, longitude: 22.46122041506702)
        let title = "TiAmo"
        let subtitle = "Restoran"

        addPlaceToMap(coordinate: coordinate, title: title, subtitle: subtitle)
    }
    
    @IBOutlet weak var map: MKMapView!
    var annotations: [MKPointAnnotation] = []
    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    
    func addPlaceToMap(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = subtitle
        
        map.addAnnotation(annotation)
        
        // Add the annotation to your list for reference
        annotations.append(annotation)
    }
    
}
