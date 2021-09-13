//
//  NVHomeViewModel.swift
//  NVWeatherStack
//

import UIKit

protocol NVHomeViewModelProtocol: AnyObject {
    func fetchWeatherFor(locationTitle: String?)
}

class NVHomeViewModel: NSObject, NVHomeViewModelProtocol {
    weak var dataSource: NVHomeViewDataSource?
    weak var weatherService: NVWeatherServiceProtocol?
    weak var homeVCDelegate: NVHomeViewControllerDelegate?

    init(
        delegate: NVHomeViewControllerDelegate?,
        weatherService: NVWeatherServiceProtocol?,
        dataSource: NVHomeViewDataSource?
    ) {
        self.homeVCDelegate = delegate
        self.weatherService = weatherService
        self.dataSource = dataSource
        self.dataSource?.data = NVDynamicValue(NVCurrentWeatherModel())
    }

    func fetchWeatherFor(locationTitle: String?) {
        guard let service = weatherService else {
            let error = NVError.custom(string: "Missing service")
            homeVCDelegate?.fetchWeatherDidFailedWith(error)
            return
        }

        guard let locationTitle = locationTitle, !locationTitle.isEmpty else {
            let error = NVError.custom(string: "Please enter location name")
            homeVCDelegate?.fetchWeatherDidFailedWith(error)
            return
        }

        service.fetchCurrentWeatherFor(locationName: locationTitle) { [weak self] result in
            self?.handleFetchWeatherDataResponseWith(result)
        }
    }
}

// MARK: - Private methods
extension NVHomeViewModel {
    private func handleFetchWeatherDataResponseWith(_ result: Result<NVCurrentWeatherModel, NVError>) {
        switch result {
        case .success(let weatherData) :
            // reload data
            self.handleFetchweatherDataSuccess(with: weatherData)

        case .failure(let error) :
            homeVCDelegate?.fetchWeatherDidFailedWith(error)

        }
    }

    private func handleFetchweatherDataSuccess(with locationDetailModel: NVCurrentWeatherModel) {
        self.dataSource?.data?.value = locationDetailModel
        homeVCDelegate?.fetchWeatherDidSucceed()
    }
}
