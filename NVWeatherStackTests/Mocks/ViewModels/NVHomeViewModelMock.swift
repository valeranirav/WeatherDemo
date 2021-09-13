//
//  NVHomeViewModelMock.swift
//  NVWeatherStackTests
//

import Foundation

@testable import NVWeatherStack

class NVHomeViewModelMock: NVHomeViewModelProtocol {
    var fetchWeatherForLocationCalled = 0
    func fetchWeatherFor(locationTitle: String?) {
        fetchWeatherForLocationCalled += 1
    }
}
