//
//  TownsInteractorOutput.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import Foundation

public protocol TownsInteractorOutput: class {
  func notifyError()
  func notifyTownsList()
  func routeToWeatherDetails()
  func routeToAddTown()
}
