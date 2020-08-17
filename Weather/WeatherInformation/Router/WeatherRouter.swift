//
//  WeatherRouter.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import UIKit

class WeatherRouter {

  // MARK: - Property

  let navigationController = UINavigationController()
  let storyboard = UIStoryboard(name: "Main", bundle: nil)
}

// MARK: - WeatherRouterProtocol

extension WeatherRouter: WeatherRouterProtocol {
  
  func routeBack() {
    UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
  }
}
