//
//  NVWeatherServiceMock.swift
//  NVWeatherStackTests
//

import Foundation

@testable import NVWeatherStack

class NVWeatherServiceMock: NVWeatherServiceProtocol {
    var fetchCurrentWeatherForLocationCalled = 0
    var sendSuccessResponse = false

    func fetchCurrentWeatherFor(locationName: String, _ completion: @escaping NVFetchCurrentWeatherDetailCompletion) {
        fetchCurrentWeatherForLocationCalled += 1
        if sendSuccessResponse {
            completion(.success(NVCurrentWeatherModel(weatherData: nil, locationData: nil)))
        } else {
            completion(.failure(.network(string: "Failed to fetch weather data")))
        }
    }
}
