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
    configureView()
  }
  
  func configureView() {
    navigationItem.title = "Weather Information"
    let backItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(WeatherViewController.didTapbackButton))
      
      navigationItem.leftBarButtonItem = backItem
  }
  
  @objc func didTapbackButton () {
    presenter.didTapBackButton()
  }
}

// MARK: - WeatherPresenterOutput

extension WeatherViewController: WeatherPresenterOutput {
  func updateWeatherData(weather: WeatherItemProtocol) {
    townLabel.text = weather.name
    guard let temperature = weather.temperature else {
        return
    }
    guard let windSpeed = weather.windSpeed else {
        return
    }
    temperatureLabel.text = temperature.description + " °F"
    windSpeedLabel.text = windSpeed.description
    guard let latitude = weather.latitude,
      let longitude = weather.longitude else {
        return
    }
    coordinatesLabel.text = "Latitude: " + latitude.description + ", Longitude: " + longitude.description
    guard let image = weather.image else {
        return
    }
    weatherIcon.image = UIImage(named: image)
  }
}

