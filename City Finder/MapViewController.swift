//
//  MapViewController.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

  // MARK: - Properties

  var button: UIButton! // Detail button for pin about info
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

  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }

  // MARK: set up the views' appearance
  func configureView() {
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

  /// Centers the map view on the city's location with a span of 0.01
  func focusMap() {
    if let city = city {
      self.title = city.name
      let center = CLLocationCoordinate2D(latitude: city.location.latitude, longitude: city.location.longitude)
      let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
      self.mapView.setRegion(region, animated: true)
    }
  }

  @objc func openInfo() {
    let controller = AboutViewController()
    let navController = UINavigationController(rootViewController: controller)
    self.present(navController, animated: true, completion: nil)
  }

}

