//
//  WeatherAdapter.swift
//  Weather
//
//  Created by Salwa Gaida on 16/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import UIKit
import WeatherDataProxy

public enum GetWeatherRepositoryError: Error {
  case noData
  case unknown
  case notInitialized
  case network
  case cancelled
}

protocol GetWeatherRepositoryAdapterWeatherProtocol {
  var weatherItem: WeatherAdapterWeatherItemProtocol { get }
}

protocol WeatherAdapterWeatherItemProtocol {
  var coordonates: WeatherAdapterCoordonatesWeatherProtocol? { get }
  var weather: [WeatherAdapterWeatherDetailsProtocol]? { get }
  var base: String? { get }
  var main: WeatherAdapterMainWeatherProtocol? { get }
  var wind: WeatherAdapterWindProtocol? { get }
  var clouds: WeatherAdapterCloudsWeatherProtocol? { get }
  var date: Int? { get }
  var sys: WeatherAdapterSysWeatherProtocol? { get }
  var timezone: Int? { get }
  var visibility: Int? { get }
  var identifier: Int? { get }
  var name: String? { get }
  var code: Int? { get }
}

protocol WeatherAdapterCoordonatesWeatherProtocol {
  var latitude: Double? { get }
  var longitude: Double? { get }
}

protocol WeatherAdapterMainWeatherProtocol {
  var temperature: Double? { get }
  var feelsLike: Double? { get }
  var temperatureMin: Double? { get }
  var temperatureMax: Double? { get }
  var pressure: Double? { get }
  var humidity: Double? { get }
}

protocol WeatherAdapterWeatherDetailsProtocol {
  var identifier: Int? { get }
  var main: String? { get }
  var description: String? { get }
  var icon: String? { get }
}

protocol WeatherAdapterCloudsWeatherProtocol {
  var all: Int? { get }
}

protocol WeatherAdapterWindProtocol {
  var speed: Double? { get }
  var degree: Double? { get }
}

protocol WeatherAdapterSysWeatherProtocol {
  var type: Int? { get }
  var identifier: Int? { get }
  var message: Double? { get }
  var country: String? { get }
  var sunrise: Int? { get }
  var sunset: Int? { get }
}

protocol WeatherAdapterWeatherProtocol {
  func cancel()
  func retrieveDataAsynchronously(success: @escaping (GetWeatherRepositoryAdapterWeatherProtocol) -> Void,
                                  failure: @escaping (GetWeatherRepositoryError
    ) -> Void)
}

class WeatherAdapter {
  // MARK: - Constants
  
  private enum Constants {
    static let enpoint = "http://api.openweathermap.org/"
    static let apiKey = "b92fa7a70f2480d8c20a67a1833a229f"
    static let path = "data/2.5/weather"
    static let defaultLanguageCode = "en"
    static let refreshDuration: TimeInterval = 60 * 10
  }
  
  // MARK: - Property
  
  private let proxy: WeatherAPIDataProxy?
  
  // MARK: - Init
  
  init(city: String) {
    
    let configuration = Configuration(host: Constants.enpoint,
                                      path: Constants.path,
                                      apiKey: Constants.apiKey,
                                      city: city)
    
    proxy = WeatherDataProxyModuleFactory.shared.makeConnector(configuration: configuration)
  }
}

// MARK: - UserProfileConnectorAdapterProtocol

extension WeatherAdapter: WeatherAdapterWeatherProtocol {
  func retrieveDataAsynchronously(success: @escaping (GetWeatherRepositoryAdapterWeatherProtocol) -> Void, failure: @escaping (GetWeatherRepositoryError) -> Void) {
    guard let proxy = proxy else {
      failure(.notInitialized)
      return
    }
    proxy.retrieveDataAsynchronously { response in
      print("response ", response)
      let weatherItem = WeatherAdapterWeatherItem(coordonates: WeatherAdapterCoordonatesWeather(latitude: response?.coordonates?.latitude, longitude: response?.coordonates?.longitude),
                                                  weather: response?.weather as! [WeatherAdapterWeatherDetailsProtocol],
                                                  base: response?.base,
                                                  main: response?.main,
                                                  wind: response?.wind,
                                                  clouds: response?.clouds,
                                                  date: response?.date,
                                                  sys: response?.sys,
                                                  timezone: response?.timezone,
                                                  visibility: response?.visibility,
                                                  identifier: response?.identifier,
                                                  name: response?.name,
                                                  code: response?.code)
      success(GetWeatherRepositoryAdapterWeather(weatherItem: weatherItem))
    }
//    proxy.retrieveDataAsynchronously(cachePolicy, identifier: identifier) { response, error in
//      switch error {
//      case let .some(error) where error.code == DataProxyErrorCode.no_internet_error_code:
//        failure(.network)
//        return
//      case let .some(error) where error.code == DataProxyErrorCode.accor_user_cancelled:
//        failure(.cancelled)
//        return
//      case .some:
//        failure(.unknown)
//        return
//      default:
//        break
//      }
//
//      guard let model = response?.model, let userResponse = model as? UserResponse else {
//        failure(.noData)
//        return
//      }
//
//      success(GetUserProfileRepositoryAdapterUser(userItem: userResponse.userItem))
//    }
  }

  func cancel() {
    guard let proxy = proxy else { return }
  }
}

// MARK: - GetWeatherRepositoryAdapterWeatherProtocol

private struct GetWeatherRepositoryAdapterWeather: GetWeatherRepositoryAdapterWeatherProtocol {
  let weatherItem: WeatherAdapterWeatherItemProtocol
}

// MARK: - WeatherAdapterWeatherItemProtocol

private struct WeatherAdapterWeatherItem: WeatherAdapterWeatherItemProtocol {
  let coordonates: WeatherAdapterCoordonatesWeatherProtocol?
  let weather: [WeatherAdapterWeatherDetailsProtocol]?
  let base: String?
  let main: WeatherAdapterMainWeatherProtocol?
  let wind: WeatherAdapterWindProtocol?
  let clouds: WeatherAdapterCloudsWeatherProtocol?
  let date: Int?
  let sys: WeatherAdapterSysWeatherProtocol?
  let timezone: Int?
  let visibility: Int?
  let identifier: Int?
  let name: String?
  let code: Int?
}

// MARK: - WeatherAdapterCoordonatesWeatherProtocol

private struct WeatherAdapterCoordonatesWeather: WeatherAdapterCoordonatesWeatherProtocol {
  var latitude: Double?
  var longitude: Double?
}

// MARK: - WeatherAdapterWeatherDetailsProtocol

private struct WeatherAdapterWeatherDetails: WeatherAdapterWeatherDetailsProtocol {
  var identifier: Int?
  var main: String?
  var description: String?
  var icon: String?
}
