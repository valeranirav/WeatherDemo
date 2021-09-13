//
//  NVHomeViewControllerTests.swift
//  NVWeatherStackTests
//

import XCTest

@testable import NVWeatherStack

class NVHomeViewControllerTests: XCTestCase {
    var subject: NVHomeViewController!
    private var weatherService: NVWeatherServiceProtocol?
    private var dataSource: NVHomeViewDataSource?
    private var viewModelMock: NVHomeViewModelMock!

    override func setUpWithError() throws {
        subject = NVHomeViewController()
        viewModelMock = NVHomeViewModelMock()
        subject.viewModel = viewModelMock
    }

    override func tearDownWithError() throws {
        viewModelMock = nil
        subject = nil
    }

    func testFetchWeatherForLocationCalledOnce() {
        subject.searchBarSearchButtonClicked(UISearchBar())
        XCTAssertEqual(viewModelMock.fetchWeatherForLocationCalled, 1)
    }
}
