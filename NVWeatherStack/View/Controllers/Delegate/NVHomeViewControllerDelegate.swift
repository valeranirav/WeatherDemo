//
//  NVHomeViewControllerDelegate.swift
//  NVWeatherStack
//

import Foundation

protocol NVHomeViewControllerDelegate: AnyObject {
    func fetchWeatherDidSucceed()
    func fetchWeatherDidFailedWith(_ error: NVError?)
}
