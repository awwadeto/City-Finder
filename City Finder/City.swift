//
//  City.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation
import UIKit

struct City {
  var id: Int
  var name: String
  var country: String
  var location: (latitude: Double, longitude: Double)
}

extension City {
  init?(json: NSDictionary) {
    guard let name = json["name"] as? String,
      let coordinatesJSON = json["coord"] as? [String: Double],
      let latitude = coordinatesJSON["lat"],
      let longitude = coordinatesJSON["lon"],
      let id = json["_id"] as? Int,
      let country = json["country"] as? String
      else {
        return nil
    }

    self.id = id
    self.name = name
    self.location = (latitude, longitude)
    self.country = country
  }
}
