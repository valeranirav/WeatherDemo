//
//  NVError.swift
//  NVWeatherStack
//

import Foundation

/** `NVError` is the error type result returned by App.
 It encompasses a few different types of errors, each with their own associated reasons.

    - network:  When error occurs because of network issue
    - parser:   When error occurs while parsing data
    - custom:   When error doesn't fall in either of the above error type
 */
enum NVError: Error {
    case network(string: String)
    case decode(string: String)
    case custom(string: String)
}
