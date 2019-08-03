//
//  CitiesView+Search.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation
import UIKit

extension CitiesViewController: UISearchResultsUpdating {

  func updateSearchResults(for searchController: UISearchController) {
    if let text = searchController.searchBar.text {
      filterContentForSearchText(text)
      isFiltering()
    }
  }

  func filterContentForSearchText(_ searchText: String) {
    let concurrentQueue = DispatchQueue(label: "searchQueue", attributes: .concurrent)
    concurrentQueue.async {
      self.viewModel.filteredCities = self.viewModel.cities.filter({( city: City) -> Bool in
        return city.name.lowercased().contains(searchText.lowercased())
      })

      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
}
