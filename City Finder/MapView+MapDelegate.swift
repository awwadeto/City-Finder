//
//  MapView+MapDelegate.swift
//  City Finder
//
//  Created by Awwad on 8/4/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension MapViewController: MKMapViewDelegate {

  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    if annotation is MKUserLocation {
      return nil
    } else {
      let reuseId = "pin"
      var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
      if let pinView = pinView {
        pinView.annotation = annotation
      } else {
        pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        pinView!.accessibilityIdentifier = "mapPin"
        pinView!.pinTintColor = .red
        pinView!.canShowCallout = true
        pinView!.isEnabled = true
        pinView!.animatesDrop = true
        pinView!.rightCalloutAccessoryView = button
        pinView!.rightCalloutAccessoryView?.accessibilityIdentifier = "mapDetail"
      }
      return pinView
    }
  }
  
}
