//
//  NVConstants.swift
//  NVWeatherStack
//

import Foundation

struct WeatherDataAPI {
    static let key = "ADD YOUR API KEY"
    static let baseURL = "http://api.weatherstack.com"
    static let currentWeatherEndPoint = "/current"

    struct QueryParameter {
        static let key = "access_key="
        static let locationName = "query="
    }
}
