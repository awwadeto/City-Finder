//
//  AboutInfo.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation
import UIKit

struct AboutInfo {
  var companyName: String
  var companyAddress: String
  var postalCode: String
  var city: String
  var details: String
}

extension AboutInfo {
  init?(json: NSDictionary) {
    guard let companyName = json["companyName"] as? String,
      let companyAddress = json["companyAddress"] as? String,
      let postalCode = json["postalCode"] as? String,
      let city = json["city"] as? String,
      let details = json["details"] as? String
    else {
        return nil
    }

    self.companyName = companyName
    self.companyAddress = companyAddress
    self.postalCode = postalCode
    self.city = city
    self.details = details
  }
}
