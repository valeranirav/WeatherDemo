//
//  NVConstants.swift
//  NVWeatherStack
//
//  Created by Nirav Valera on 13/09/21.
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
