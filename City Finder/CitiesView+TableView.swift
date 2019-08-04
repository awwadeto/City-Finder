//
//  CitiesView+TableView.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension CitiesViewController {

  // MARK: - Table View

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfCells
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityCellView
    let city = viewModel.selectCell(row: indexPath.row)
    cell.populateCell(city: city)
    cell.accessibilityIdentifier = "cityCell_\(indexPath.row)"
    return cell
  }

  // MARK: passing selected city to MapView
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let city = viewModel.selectCell(row: indexPath.row)
    let location = MKPointAnnotation()
    location.title = city.name
    location.coordinate = CLLocationCoordinate2D(latitude: city.location.latitude, longitude: city.location.longitude)
    let controller = MapViewController()
    controller.city = city
    controller.annotation = location
    if let splitViewController = splitViewController {
      splitViewController.showDetailViewController(controller, sender: self)
    }
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80.0
  }
}
