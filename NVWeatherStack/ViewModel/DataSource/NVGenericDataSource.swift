//
//  NVGenericDataSource.swift
//  NVWeatherStack
//

import Foundation

/// `NVGenericDataSource` is generic class for dictionary type of data,
/// which will provide functionality of separating ViewModel to the data layer.
/// This class can be reused regardless the data we would like to update

class NVGenericDataSource<T>: NSObject {
    var data: NVDynamicValue<T>?
}
