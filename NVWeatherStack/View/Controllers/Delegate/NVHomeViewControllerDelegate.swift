//
//  NVHomeViewControllerDelegate.swift
//  NVWeatherStack
//
//  Created by Nirav Valera on 13/09/21.
//

import Foundation

protocol NVHomeViewControllerDelegate: AnyObject {
    func fetchWeatherDidSucceed()
    func fetchWeatherDidFailedWith(_ error: NVError?)
}
