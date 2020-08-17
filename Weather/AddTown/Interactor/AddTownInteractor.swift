//
//  AddTownInteractor.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import Foundation

class AddTownInteractor {

  // MARK: - Property

  weak var output: AddTownInteractorOutput?
  private var town: String?
  let defaults = UserDefaults.standard

  // MARK: - Lifecycle

  init() {}
}

// MARK: - AddTownInteractorInput

extension AddTownInteractor: AddTownInteractorInput {
  func confirmAddTown(with name: String) {
    var towns = defaults.array(forKey: "Towns")
    if towns == nil {
      towns = []
    }
    towns?.append(name)
    defaults.set(towns, forKey: "Towns")
    defaults.synchronize()
    output?.notifyTownAdded()
  }
}

// MARK: - TownItemProtocol

private struct TownItem: TownItemProtocol {
  let name: String
}
