//
//  Helpers.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation
import UIKit

/**
 Get array of cities from JSON file.

 - Returns: An array of cities

 */
func getCities() -> [City] {
  var fileName = "cities"
  #if DEBUG
  if CommandLine.arguments.contains("enable-testing") {
    fileName = "citiesUITest"
  }
  #endif

  var arrayOfCities: [City] = []
  do {
    guard let path = Bundle.main.url(forResource: fileName, withExtension: "json") else {
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

/**
 Get about info from JSON file.

 - Returns: An aboutInfo Object with all related info

 */
func getAboutInfo() -> AboutInfo? {
  do {
    guard let path = Bundle.main.url(forResource: "aboutInfo", withExtension: "json") else {
      debugPrint("not found")
      return nil
    }
    let data = try Data(contentsOf: path)
    let aboutInfo = try JSONSerialization.jsonObject(with: data, options: [])
    if let aboutInfo = aboutInfo as? NSDictionary {
      if let info = AboutInfo(json: aboutInfo) {
        return info
      }
    }
  } catch {
    print("error: \(error.localizedDescription)")
  }
  return nil
}
