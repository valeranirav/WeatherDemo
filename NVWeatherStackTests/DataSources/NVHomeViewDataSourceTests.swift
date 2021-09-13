//
//  NVHomeViewDataSourceTests.swift
//  NVWeatherStackTests
//
//  Created by Nirav Valera on 13/09/21.
//

import XCTest

@testable import NVWeatherStack

class NVHomeViewDataSourceTests: XCTestCase {
    var subject: NVHomeViewDataSource!

    override func setUpWithError() throws {
        subject = NVHomeViewDataSource()
    }

    override func tearDownWithError() throws {
        subject = nil
    }

    func testNumberOfRowsInSectionWhenDataIsNil() {
        let rows = subject.tableView(UITableView(), numberOfRowsInSection: 1)
        XCTAssertEqual(rows, 0)
    }

    func testNumberOfRowsInSectionWhenDataIsNotNil() {
        // Providing data 
        let weatherDetail = NVCurrentWeatherDetailModel(
            windDirection: "SW",
            pressure: 1016,
            precip: 0.0,
            humidity: 67,
            cloudCover: 11
        )
        let locationDetail = NVLocationDetailModel(name: "New york")
        let currentWeatherModel = NVCurrentWeatherModel(weatherData: weatherDetail, locationData: locationDetail)
        subject.data = NVDynamicValue(currentWeatherModel)

        let rows = subject.tableView(UITableView(), numberOfRowsInSection: 1)
        XCTAssertEqual(rows, 1)
    }
}
