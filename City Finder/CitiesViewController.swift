//
//  CitiesViewController.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import UIKit
import MapKit

class CitiesViewController: UITableViewController, UISearchResultsUpdating {

  var searchController = UISearchController(searchResultsController: nil)
  var mapViewController: MapViewController? = nil
  var objects = [Any]()
  var cities = getCities()
  var filteredCities = [City]()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupView()
    if let split = splitViewController {
      let controllers = split.viewControllers
      mapViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? MapViewController
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }

  @objc
  func insertNewObject(_ sender: Any) {
    objects.insert(NSDate(), at: 0)
    let indexPath = IndexPath(row: 0, section: 0)
    tableView.insertRows(at: [indexPath], with: .automatic)
  }

  // MARK: - Segues

//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "showDetail" {
//        if let indexPath = tableView.indexPathForSelectedRow {
//            let object = objects[indexPath.row] as! NSDate
//            let controller = (segue.destination as! UINavigationController).topViewController as! MapViewController
//            controller.detailItem = object
//            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//            controller.navigationItem.leftItemsSupplementBackButton = true
//        }
//    }
//  }

  // MARK: - Table View

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if isFiltering() {
      return filteredCities.count
    }
    return cities.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityCellView

    let city = isFiltering() ? filteredCities[indexPath.row] : cities[indexPath.row]
    cell.titleLabel.text = "\(city.name), \(city.country)"
    cell.detailLabel.text = "Latitude: \(city.location.latitude), Longitude: \(city.location.longitude)"
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let city = isFiltering() ? filteredCities[indexPath.row] : cities[indexPath.row]
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

  func setupView() {
    tableView.register(CityCellView.self, forCellReuseIdentifier: "cityCell")
    //searchController.searchBar.delegate = self
    searchController.dimsBackgroundDuringPresentation = false
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search for city"
    self.navigationItem.searchController = searchController
    definesPresentationContext = true

  }

  func updateSearchResults(for searchController: UISearchController) {
    if let text = searchController.searchBar.text {
      filterContentForSearchText(text)
    }
  }

  func searchBarIsEmpty() -> Bool {
    // Returns true if the text is empty or nil
    return searchController.searchBar.text?.isEmpty ?? true
  }

  func filterContentForSearchText(_ searchText: String) {
    let concurrentQueue = DispatchQueue(label: "searchQueue", attributes: .concurrent)
    concurrentQueue.async {
      self.filteredCities = self.cities.filter({( city: City) -> Bool in
        return city.name.lowercased().contains(searchText.lowercased())
      })

      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

  func isFiltering() -> Bool {
    return searchController.isActive && !searchBarIsEmpty()
  }

}

