//
//  MapViewController.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

  var mapView: MKMapView!
  var city: City? {
    didSet {
      configureView()
      focusMap()
    }
  }
  var annotation: MKAnnotation! {
    didSet {
      self.mapView.removeAnnotation(annotation)
      self.mapView.addAnnotation(annotation)
    }
  }

  var button: UIButton!

  func configureView() {
    // Update the user interface for the detail item.

    mapView = MKMapView()
    mapView.translatesAutoresizingMaskIntoConstraints = false
    mapView.delegate = self
    self.view.addSubview(mapView)

    button = UIButton(type: .detailDisclosure)
    button.addTarget(self, action: #selector(openInfo), for: .touchUpInside)

    NSLayoutConstraint.activate([
      mapView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      mapView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
      mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      ])
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    configureView()
  }

  func focusMap() {
    if let city = city {
      let center = CLLocationCoordinate2D(latitude: city.location.latitude, longitude: city.location.longitude)
      let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
      self.mapView.setRegion(region, animated: true)
    }
  }

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
        pinView!.pinTintColor = .red
        pinView!.canShowCallout = true
        pinView!.isEnabled = true
        pinView!.animatesDrop = true
        pinView!.rightCalloutAccessoryView = button
      }
      return pinView
    }
  }

  @objc func openInfo() {
    let controller = AboutViewController()
    let navController = UINavigationController(rootViewController: controller)
    self.present(navController, animated: true, completion: nil)
  }

}

