//
//  WeatherInteractorInput.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import Foundation

public protocol WeatherInteractorInput {
  var output: WeatherInteractorOutput? { get set }
  func retrieve()
  func routeBack()
}
