//
//  ViewController.swift
//  Map
//
//  Created by Kaan Aslan on 29.03.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var coordinateLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        mapView.delegate = self
       
        let location = CLLocationCoordinate2D(latitude: 41.068205, longitude: 29.000837)
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Dernek"
        annotation.subtitle = "C ve Sistem Programcıları Derneği"
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 2
        mapView.addGestureRecognizer(gestureRecognizer)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
      //  locationManager.startUpdatingLocation()
    }
    
    @objc
    func longPress(gestureRecognizer: UIGestureRecognizer)
    {
        let point = gestureRecognizer.location(in: mapView)
        let location = mapView.convert(point, toCoordinateFrom: self.mapView)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Way Point"
        annotation.subtitle = "\(location.latitude), \(location.longitude)"
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        coordinateLabel.text = "\(location.coordinate.latitude)\n\(location.coordinate.longitude)"
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
       mapView.removeAnnotation(view.annotation!)
    }
}
