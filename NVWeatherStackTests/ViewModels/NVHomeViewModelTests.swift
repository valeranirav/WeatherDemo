//
//  NVHomeViewModelTests.swift
//  NVWeatherStackTests
//

import XCTest

@testable import NVWeatherStack

class NVHomeViewModelTests: XCTestCase {
    var subject: NVHomeViewModel!
    private var dataSource: NVHomeViewDataSource!
    private var serviceMock: NVWeatherServiceMock!
    private var vcMock: NVHomeViewControllerMock!

    override func setUpWithError() throws {
        vcMock = NVHomeViewControllerMock()
        dataSource = NVHomeViewDataSource()
        serviceMock = NVWeatherServiceMock()
        subject = NVHomeViewModel(delegate: vcMock, weatherService: serviceMock, dataSource: dataSource)
    }

    override func tearDownWithError() throws {
        vcMock = nil
        dataSource = nil
        serviceMock = nil
        subject = nil
    }

    func testPropertiesAreNotNil() {
        XCTAssertNotNil(subject.homeVCDelegate)
        XCTAssertNotNil(subject.weatherService)
        XCTAssertNotNil(subject.dataSource)
    }

    func testFetchWeatherForLocationButWeatherServiceIsNil() {
        // Not providing weather service to a view model. So expected to not be able to fetch Locations

        subject.weatherService = nil
        subject.fetchWeatherFor(locationTitle: "New york")

        XCTAssertEqual(serviceMock.fetchCurrentWeatherForLocationCalled, 0)

        XCTAssertEqual(vcMock.fetchWeatherDidSucceedCalled, 0)
        XCTAssertEqual(vcMock.fetchWeatherDidFailedWithErrorCalled, 1)
    }

    func testFetchWeatherForLocationButLocationIsNil() {
        // Not providing location name. So expected to not be able to fetch Locations

        subject.weatherService = nil
        subject.fetchWeatherFor(locationTitle: nil)

        XCTAssertEqual(serviceMock.fetchCurrentWeatherForLocationCalled, 0)

        XCTAssertEqual(vcMock.fetchWeatherDidSucceedCalled, 0)
        XCTAssertEqual(vcMock.fetchWeatherDidFailedWithErrorCalled, 1)
    }

    func testFetchWeatherForLocationButLocationIsEmpty() {
        // Not providing location name. So expected to not be able to fetch Locations

        subject.weatherService = nil
        subject.fetchWeatherFor(locationTitle: "")

        XCTAssertEqual(serviceMock.fetchCurrentWeatherForLocationCalled, 0)

        XCTAssertEqual(vcMock.fetchWeatherDidSucceedCalled, 0)
        XCTAssertEqual(vcMock.fetchWeatherDidFailedWithErrorCalled, 1)
    }

    func testFetchWeatherForLocationWithProperValuesAndSuccessResponse() {
        // Providing all data to a view model. So expected to be able to fetch weather data

        serviceMock.sendSuccessResponse = true
        subject.fetchWeatherFor(locationTitle: "New york")

        XCTAssertEqual(serviceMock.fetchCurrentWeatherForLocationCalled, 1)

        XCTAssertEqual(vcMock.fetchWeatherDidSucceedCalled, 1)
        XCTAssertEqual(vcMock.fetchWeatherDidFailedWithErrorCalled, 0)
    }

    func testFetchWeatherForLocationWithProperValuesAndFailedResponse() {
        // Providing all data to a view model.

        subject.fetchWeatherFor(locationTitle: "New york")

        XCTAssertEqual(serviceMock.fetchCurrentWeatherForLocationCalled, 1)

        XCTAssertEqual(vcMock.fetchWeatherDidSucceedCalled, 0)
        XCTAssertEqual(vcMock.fetchWeatherDidFailedWithErrorCalled, 1)
    }
}
