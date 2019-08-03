//
//  CitiesViewModel.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation
import UIKit

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

}
