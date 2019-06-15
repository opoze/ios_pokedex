//
//  PokedexUITests.swift
//  PokedexUITests
//
//  Created by Luis Alberto Zagonel Pozenato on 15/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import XCTest

class PokedexUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITests"]
        app.launch()
    }

    override func tearDown() {
    }

    func testExample() {

        let cells = app.descendants(matching: .cell)
        let firstCell = cells.firstMatch
        firstCell.tap()        
        XCTAssertTrue(app.otherElements["detailView"].waitForExistence(timeout: 1))
    }

}
