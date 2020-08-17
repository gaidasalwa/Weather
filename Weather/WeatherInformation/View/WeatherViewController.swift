//
//  WeatherViewController.swift
//  Weather
//
//  Created by Salwa Gaida on 10/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
  
  // MARK: - Outlets

  @IBOutlet private weak var townLabel: UILabel!
  @IBOutlet private weak var coordinatesLabel: UILabel!
  @IBOutlet private weak var windSpeedLabel: UILabel!
  @IBOutlet private weak var temperatureLabel: UILabel!
  @IBOutlet private weak var weatherIcon: UIImageView!
  
  // MARK: - parameters
  
  var presenter: WeatherPresenterInput!

  override func viewDidLoad() {
    super.viewDidLoad()
    let interactor = WeatherInteractor()
    let router = WeatherRouter()
    let weatherPresenter = WeatherPresenter(interactor: interactor, router: router)
    weatherPresenter.output = self
    interactor.output = weatherPresenter
    presenter = weatherPresenter
    presenter.viewDidLoad()
  }
}

// MARK: - WeatherPresenterOutput

extension WeatherViewController: WeatherPresenterOutput {
  func updateWeatherData(weather: WeatherItemProtocol) {
    townLabel.text = weather.name
    temperatureLabel.text = "\(weather.temperature)" + "°"
    windSpeedLabel.text = "\(weather.windSpeed)"
    coordinatesLabel.text = "Latitude: " + "\(weather.latitude)" + ", Longitude: " + "\(weather.longitude)"
  }
}

