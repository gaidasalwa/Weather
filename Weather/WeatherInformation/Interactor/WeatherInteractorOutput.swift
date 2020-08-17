//
//  WeatherInteractorOutput.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import Foundation

public protocol WeatherItemProtocol {
  var latitude: Double? { get }
  var longitude: Double? { get }
  var name: String? { get }
  var windSpeed: Double? { get }
  var windDegree: Double? { get }
  var temperature: Double? { get }
  var image: String? { get }
}

public protocol WeatherInteractorOutput: class {
  func notifyError()
  func notifyWeatherInformation(weather: WeatherItemProtocol)
  func routeBack()
}
