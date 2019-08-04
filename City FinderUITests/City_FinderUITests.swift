//
//  City_FinderUITests.swift
//  City FinderUITests
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import XCTest

class City_FinderUITests: XCTestCase {

  var app: XCUIApplication!

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    app = XCUIApplication()
    app.launchArguments = ["enable-testing"]
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    app.launch()

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    app.launchArguments.append("--uitesting")
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testOpenMap() {
    let searchBar = app.searchFields["Search for city"]
    searchBar.tap()
    searchBar.typeText("beirut")

    let myTable = app.tables.matching(identifier: "cityTableView")
    let cell = myTable.cells.element(matching: .cell, identifier: "cityCell_0")
    cell.tap()

    let annotation = app.otherElements.matching(identifier: "mapPin").element(boundBy: 0)
    annotation.tap()
  }

}
