//
//  CitiesViewModel.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation

class CitiesViewModel {

  var viewController: CitiesViewController?
  var cities = getCities()
  var filteredCities = [City]()
  var isSearching = false

  var numberOfCells: Int {
    if isSearching {
      return filteredCities.count
    }
    return cities.count
  }

  // MARK: Initialisation
  init(viewController: CitiesViewController?) {
    self.viewController = viewController
  }

  func selectCell(row: Int) -> City {
    return isSearching ? filteredCities[row] : cities[row]
  }

  /**
   Filters cities by name.

   - Parameter searchText: City name entered by user

   */
  func filterContentForSearchText(_ searchText: String, completion: @escaping () -> Void) {
    let concurrentQueue = DispatchQueue(label: "searchQueue", attributes: .concurrent)
    concurrentQueue.async {
      self.filteredCities = self.cities.filter({ (city: City) -> Bool in
        return city.name.lowercased().contains(searchText.lowercased())
      })
      completion()

      DispatchQueue.main.async {
        self.viewController?.updateView()
      }
    }
  }

}
