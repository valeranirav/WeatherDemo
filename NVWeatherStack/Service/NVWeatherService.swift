//
//  NVWeatherService.swift
//  NVWeatherStack
//

import Foundation

typealias NVFetchCurrentWeatherDetailCompletion = ((Result<NVCurrentWeatherModel, NVError>) -> Void)

/// Types adopting the `NVWeatherServiceProtocol` protocol can be used to fetch weather data

protocol NVWeatherServiceProtocol: AnyObject {
    /**
     Fetch weather data for location name

     - parameter locationName: Represents the name of the location
     - parameter completion:   A closure to be executed once the weather details are fetched.
     */
    func fetchCurrentWeatherFor(locationName: String, _ completion: @escaping NVFetchCurrentWeatherDetailCompletion)
}

final class NVLocationService: NVRequestHandler, NVWeatherServiceProtocol {
    var task: URLSessionTask?

    /**
     Fetch weather data for location name

     - parameter locationName: Represents the name of the location
     - parameter completion:   A closure to be executed once the weather details are fetched.
     */

    func fetchCurrentWeatherFor(locationName: String, _ completion: @escaping NVFetchCurrentWeatherDetailCompletion) {
        if let locationParam = "\(WeatherDataAPI.QueryParameter.locationName)\(locationName)".addingPercentEncoding(
            withAllowedCharacters: .urlHostAllowed
        ) {
            let keyParam = "\(WeatherDataAPI.QueryParameter.key)\(WeatherDataAPI.key)"
            let queryParameters = "?\(keyParam)&\(locationParam)"
            let endpoint = "\(WeatherDataAPI.baseURL)\(WeatherDataAPI.currentWeatherEndPoint)\(queryParameters)"

            // cancel previous request if already in progress
            cancelLocationTask()

            task = NVRequestService().loadData(urlString: endpoint, completion: networkResult(completion: completion))
        }
    }

    /// Responsible to cancel location task

    func cancelLocationTask() {
        if let task = task {
            task.cancel()
            self.task = nil
        }
    }
}
