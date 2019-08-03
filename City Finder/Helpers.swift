//
//  Helpers.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation
import UIKit

func getCities() -> [City] {
  var arrayOfCities: [City] = []
  do {
    guard let path = Bundle.main.url(forResource: "cities", withExtension: "json") else {
      debugPrint("not found")
      return []
    }
    let data = try Data(contentsOf: path)
    let cities = try JSONSerialization.jsonObject(with: data, options: [])
    if let cities = cities as? [NSDictionary] {
      for item in cities {
        if let city = City(json: item) {
          arrayOfCities.append(city)
        }
      }
    }
    arrayOfCities = arrayOfCities.sorted(by: { (a, b) -> Bool in
      a.name < b.name
    })
    return arrayOfCities
  } catch {
    print("error: \(error.localizedDescription)")
  }
  return arrayOfCities
}
