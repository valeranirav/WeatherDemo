//
//  NVCurrentWeatherModel.swift
//  NVWeatherStack
//

import Foundation

struct NVCurrentWeatherModel: Decodable {
    let currentWeatherDetails: NVCurrentWeatherDetailModel?
    let locationDetail: NVLocationDetailModel?

    enum CodingKeys: String, CodingKey {
        case currentWeatherDetails = "current"
        case locationDetail = "location"
    }

    init(weatherData: NVCurrentWeatherDetailModel? = nil, locationData: NVLocationDetailModel? = nil) {
        self.currentWeatherDetails = weatherData
        self.locationDetail = locationData
    }
}

struct NVCurrentWeatherDetailModel: Decodable {
    let windDirection: String
    let pressure: Int
    let precip: Double
    let humidity: Int
    let cloudCover: Int

    enum CodingKeys: String, CodingKey {
        case windDirection = "wind_dir"
        case pressure = "pressure"
        case precip = "precip"
        case humidity = "humidity"
        case cloudCover = "cloudcover"
    }
}

struct NVLocationDetailModel: Decodable {
    let name: String
}
