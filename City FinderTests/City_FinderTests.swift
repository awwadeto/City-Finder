//
//  City_FinderTests.swift
//  City FinderTests
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import XCTest
@testable import City_Finder

class City_FinderTests: XCTestCase {

  var sut: CitiesViewModel!

  override func setUp() {
      // Put setup code here. This method is called before the invocation of each test method in the class.
    super.setUp()
    sut = CitiesViewModel(viewController: nil)
  }

  override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
    sut = nil
    super.tearDown()
  }

  func testNumberOfCells() {
    XCTAssertEqual(209557, sut.numberOfCells)
    sut.isSearching = true
    XCTAssertEqual(0, sut.numberOfCells)
  }

  func testFilterContent() {
    let expectation = self.expectation(description: "Searching")
    self.sut.isSearching = true
    sut.filterContentForSearchText("beirut") {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 5, handler: nil)
    XCTAssertEqual(1, self.sut.filteredCities.count)
    XCTAssertEqual("Beirut", self.sut.selectCell(row: 0).name)

    let wrongExpectation = self.expectation(description: "wrongSearching")
    sut.filterContentForSearchText("amsterdams") {
      wrongExpectation.fulfill()
    }
    waitForExpectations(timeout: 5, handler: nil)
    XCTAssertEqual(0, self.sut.filteredCities.count)

    let multipleExpectation = self.expectation(description: "multipleSearching")
    sut.filterContentForSearchText("amster") {
      multipleExpectation.fulfill()
    }
    waitForExpectations(timeout: 5, handler: nil)
    XCTAssertEqual(8, self.sut.filteredCities.count)
  }

  func testSelectCell() {
    let city = sut.selectCell(row: 0)
    XCTAssertEqual("'t Hoeksken", city.name)
    XCTAssertNotEqual("Beirut", city.name)
  }

}
