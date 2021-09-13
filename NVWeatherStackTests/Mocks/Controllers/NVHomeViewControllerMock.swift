//
//  NVHomeViewControllerMock.swift
//  NVWeatherStackTests
//

import Foundation

@testable import NVWeatherStack

class NVHomeViewControllerMock: NVHomeViewControllerDelegate {
    var fetchWeatherDidSucceedCalled = 0
    var fetchWeatherDidFailedWithErrorCalled = 0

    func fetchWeatherDidSucceed() {
        fetchWeatherDidSucceedCalled += 1
    }

    func fetchWeatherDidFailedWith(_ error: NVError?) {
        fetchWeatherDidFailedWithErrorCalled += 1
    }
}
