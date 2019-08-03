//
//  AboutViewModel.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation

class AboutViewModel {

  var viewController: AboutViewController?
  typealias AboutInfoField = (name: String, keyPath: KeyPath<AboutInfo, String>)

  let fields: [AboutInfoField] = [
    (name: "Name", keyPath: \AboutInfo.companyName),
    (name: "Address", keyPath: \AboutInfo.companyAddress),
    (name: "Postal Code", keyPath: \AboutInfo.postalCode),
    (name: "City", keyPath: \AboutInfo.city),
    (name: "Details", keyPath: \AboutInfo.details),
  ]

  var aboutInfo: AboutInfo? {
    if let info = getAboutInfo() {
      return info
    }
    return nil
  }

  var numberOfCells: Int {
    return fields.count
  }

  init(viewController: AboutViewController?) {
    self.viewController = viewController
  }

}
