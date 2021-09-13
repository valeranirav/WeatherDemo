//
//  NVWeatherServiceTests.swift
//  NVWeatherStackTests
//
//  Created by Nirav Valera on 13/09/21.
//

import XCTest

@testable import NVWeatherStack

class NVWeatherServiceTests: XCTestCase {
    var subject: NVWeatherService!

    override func setUpWithError() throws {
        subject = NVWeatherService()
    }

    override func tearDownWithError() throws {
        subject = nil
    }

    func testCancelRequest() {
        subject.fetchCurrentWeatherFor(locationName: "New york") { _ in

        }
        XCTAssertNotNil(subject.task, "Expected task not nil")

        // Expected to task nil after cancel
        subject.cancelLocationTask()
        XCTAssertNil(subject.task, "Expected task nil")
    }
}
