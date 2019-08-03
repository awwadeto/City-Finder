//
//  AboutViewModelTests.swift
//  City FinderTests
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import XCTest
@testable import City_Finder

class AboutViewModelTests: XCTestCase {

  var sut: AboutViewModel!

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    super.setUp()
    sut = AboutViewModel(viewController: nil)
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    sut = nil
    super.tearDown()
  }

  func testNumberOfCells() {
    XCTAssertEqual(5, sut.numberOfCells)
  }

  func testFields() {
    XCTAssertEqual("Amsterdam", sut.aboutInfo?.city)
    XCTAssertEqual("Jacob Bontiusplaats 9", sut.aboutInfo?.companyAddress)
    XCTAssertEqual("Backbase", sut.aboutInfo?.companyName)
    XCTAssertEqual("This is the Backbase assignment for Android engineering positions.", sut.aboutInfo?.details)
    XCTAssertEqual("1018 LL", sut.aboutInfo?.postalCode)
  }

}
