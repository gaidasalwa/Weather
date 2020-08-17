//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import Foundation

final class WeatherPresenter {

  // MARK: - Property

  weak var output: WeatherPresenterOutput?
  private let interactor: WeatherInteractorInput
  private let router: WeatherRouterProtocol

  // MARK: - Lifecycle

  init(interactor: WeatherInteractorInput, router: WeatherRouterProtocol) {
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - WeatherPresenterInput

extension WeatherPresenter: WeatherPresenterInput {
  func viewDidLoad() {
    interactor.retrieve()
  }
  
  func didTapBackButton() {
    interactor.routeBack()
  }
}

// MARK: - WeatherInteractorOutput

extension WeatherPresenter: WeatherInteractorOutput {
  
  func notifyError() {
    
  }
  
  func notifyWeatherInformation(weather: WeatherItemProtocol) {
    output?.updateWeatherData(weather: weather)
  }
  
  func routeBack() {
    router.routeBack()
  }
}
