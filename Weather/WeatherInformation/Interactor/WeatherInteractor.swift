//
//  WeatherInteractor.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import Foundation
import WeatherDataProxy

class WeatherInteractor {

  // MARK: - Property

  weak var output: WeatherInteractorOutput?
  let defaults = UserDefaults.standard

  // MARK: - Lifecycle

  init() {}
}

// MARK: - WeatherInteractorInput

extension WeatherInteractor: WeatherInteractorInput {
  
  func retrieve() {
    guard let selectedTown = UserDefaults.standard.string(forKey: "SelectedTown") else {
      output?.notifyError()
      return
    }
    let adapter = WeatherAdapter(city: selectedTown)
    adapter.retrieveDataAsynchronously(success: { weather in
      let weatherItem = WeatherItem(latitude: weather.weatherItem.coordonates?.latitude, longitude: weather.weatherItem.coordonates?.longitude, name: weather.weatherItem.name, windSpeed: weather.weatherItem.wind?.speed, windDegree: weather.weatherItem.wind?.degree, temperature: weather.weatherItem.main?.temperature, image: weather.weatherItem.weather?.first?.icon)
      self.output?.notifyWeatherInformation(weather: weatherItem)
    }, failure: {_ in
      self.output?.notifyError()
    })
    
  }
  
  func routeBack() {
    output?.routeBack()
  }
}

private struct WeatherItem: WeatherItemProtocol {
  let latitude: Double?
  let longitude: Double?
  let name: String?
  let windSpeed: Double?
  let windDegree: Double?
  let temperature: Double?
  let image: String?
}

