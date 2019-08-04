//
//  CitiesViewController.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import UIKit

class CitiesViewController: UITableViewController {

  // MARK: - Properties

  var viewModel: CitiesViewModel!
  var searchController = UISearchController(searchResultsController: nil)
  var mapViewController: MapViewController? = nil

  var searchBarIsEmpty: Bool {
    return searchController.searchBar.text?.isEmpty ?? true
  }

  // MARK: - Initialization

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    viewModel = CitiesViewModel(viewController: self)
  }

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
    navigationItem.hidesSearchBarWhenScrolling = false
    super.viewWillAppear(animated)
  }

  // MARK: set up the searchController's appearance
  func setupView() {
    self.title = "Cities"
    tableView.accessibilityIdentifier = "cityTableView"
    tableView.register(CityCellView.self, forCellReuseIdentifier: "cityCell")
    //searchController.searchBar.delegate = self
    searchController.dimsBackgroundDuringPresentation = false
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search for city"
    self.navigationItem.searchController = searchController
    definesPresentationContext = true
  }

  // MARK: updating data source
  func isFiltering() {
    viewModel.isSearching = searchController.isActive && !searchBarIsEmpty
  }

  // MARK: updating view after search
  func updateView() {
    self.tableView.reloadData()
  }

}

