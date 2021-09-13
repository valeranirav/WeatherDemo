//
//  NVWeatherDetailCell.swift
//  NVWeatherStack
//

import UIKit

struct NVWeatherDetailCellConstants {
    static let identifier = "weatherDetailCell"
    static let windDirectionText = "Wind Direction:"
    static let pressureText = "Pressure:"
    static let precipText = "Precip:"
    static let humidityText = "Humidity:"
    static let cloudCoverText = "Cloud Cover:"
}

class NVWeatherDetailCell: UITableViewCell {
    @IBOutlet private weak var locationNameLabel: UILabel!
    @IBOutlet private weak var windDirectionLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var precipLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var cloudCoverLabel: UILabel!

    var weatherObject: NVCurrentWeatherModel? {
        didSet {
            setContent()
        }
    }

    private func setContent() {
        guard let weatherObject = weatherObject,
              let currentWeatherDetails = weatherObject.currentWeatherDetails,
              let locationDetail = weatherObject.locationDetail else {
            return
        }

        locationNameLabel.text = locationDetail.name

        let windDirectionTitleText = "\(NVWeatherDetailCellConstants.windDirectionText)"
        windDirectionLabel.text = "\(windDirectionTitleText) \(currentWeatherDetails.windDirection)"
        pressureLabel.text = "\(NVWeatherDetailCellConstants.pressureText) \(currentWeatherDetails.pressure) MB"
        precipLabel.text = "\(NVWeatherDetailCellConstants.precipText) \(currentWeatherDetails.precip) MM"
        humidityLabel.text = "\(NVWeatherDetailCellConstants.humidityText) \(currentWeatherDetails.humidity)%"
        cloudCoverLabel.text = "\(NVWeatherDetailCellConstants.cloudCoverText) \(currentWeatherDetails.cloudCover)%"
    }
}
