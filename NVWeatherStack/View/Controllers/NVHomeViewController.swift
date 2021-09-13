//
//  ViewController.swift
//  NVWeatherStack
//

import UIKit

class NVHomeViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    var weatherService: NVWeatherServiceProtocol?
    var dataSource: NVHomeViewDataSource?
    var viewModel: NVHomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureViewModel()
        self.setupUI()
    }
}

// MARK: General Setup Methods
extension NVHomeViewController {
    private func setupUI() {
        setupTableView()
        setupSearchBar()
    }

    private func setupTableView() {
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = dataSource
        dataSource?.data?.addAndNotify(observer: self) { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.hideIndicator()
            }
        }
    }

    private func setupSearchBar() {
        searchBar.becomeFirstResponder()
        searchBar.delegate = self
        searchBar.searchTextField.clearButtonMode = .never
    }

    private func configureViewModel() {
        self.weatherService = NVLocationService()
        self.dataSource = NVHomeViewDataSource()
        self.viewModel = NVHomeViewModel(delegate: self, weatherService: weatherService, dataSource: dataSource)
    }

    private func showIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.activityIndicator.startAnimating()
        }
    }

    private func hideIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.activityIndicator.stopAnimating()
        }
    }
}

// MARK: Data Methods
extension NVHomeViewController {
    private func loadLocations(with locationTitle: String?) {
        showIndicator()
        viewModel?.fetchWeatherFor(locationTitle: locationTitle)
    }
}

// MARK: - NVLocationListViewControllerDelegate Methods
extension NVHomeViewController: NVHomeViewControllerDelegate {
    func fetchWeatherDidSucceed() {

    }

    func fetchWeatherDidFailedWith(_ error: NVError?) {
        DispatchQueue.main.async {
            UIAlertController.showAlertWithOkButton(
                controller: self, strMessage: "Unable to fetch weather data", completion: nil
            )
            self.hideIndicator()
        }
    }
}

// MARK: UISearchBarDelegate Mwthods
extension NVHomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.loadLocations(with: searchBar.searchTextField.text)
        searchBar.resignFirstResponder()
    }
}
