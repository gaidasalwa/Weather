//
//  WeatherRouter.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//


import Foundation
import UIKit

class TownsRouter {

  // MARK: - Property

  let navigationController = UINavigationController()
  let storyboard = UIStoryboard(name: "Main", bundle: nil)
}

// MARK: - TownsRouterProtocol

extension TownsRouter: TownsRouterProtocol {

  func routeToWeatherDetails() {
    let viewController = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
    UIApplication.shared.keyWindow?.rootViewController?.present(viewController, animated: true, completion: nil)
  }
  
  func routeToAddTown() {
    let viewController = storyboard.instantiateViewController(withIdentifier: "AddTownViewController") as! AddTownViewController
    UIApplication.shared.keyWindow?.rootViewController?.present(viewController, animated: true, completion: nil)
  }
}
