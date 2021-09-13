//
//  NVHomeViewDataSource.swift
//  NVWeatherStack
//

import Foundation
import UIKit
/**
 `NVHomeViewDataSource` acts as a dataSource for `NVLocationViewController`

 It will implement the `UITableViewDataSource` methods
 This class allow us to saperate data layer from viewModel. So test case can be written even more accurately
*/
class NVHomeViewDataSource: NVGenericDataSource<NVCurrentWeatherModel>, UITableViewDataSource {

// MARK: UITableViewDataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard data?.value.currentWeatherDetails != nil else {
            return 0
        }
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherDetail = data?.value
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NVWeatherDetailCellConstants.identifier, for: indexPath
        ) as? NVWeatherDetailCell
        cell?.weatherObject = weatherDetail
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell ?? UITableViewCell()
    }
}
