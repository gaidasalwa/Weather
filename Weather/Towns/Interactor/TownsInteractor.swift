//
//  TownsInteractor.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import Foundation

class TownsInteractor {

  // MARK: - Constants
  enum Constants {
    static let numberOfCategories = 1
  }

  // MARK: - Property

  weak var output: TownsInteractorOutput?
  private var towns: [TownItemProtocol]? = []
  let defaults = UserDefaults.standard

  // MARK: - Lifecycle

  init() {}
}

// MARK: - TownsInteractorInput

extension TownsInteractor: TownsInteractorInput {
  
  func retrieve() {
    let townsStored = defaults.array(forKey: "Towns") as? [String] ?? [String]()
    for town in townsStored {
      towns?.append(TownItem(name: town))
    }
  }

  var numberOfCategories: Int {
    Constants.numberOfCategories
  }

  func numberOfItems(for category: Int) -> Int {
    guard category == 0 else { return 0 }
    return towns?.count ?? 0
  }

  func item(at index: Int, for category: Int) -> TownItemProtocol? {
    guard category == 0 else { return nil }
    return towns?[index]
  }

  func selectItem(at index: Int, for category: Int) {
    guard category == 0 else { return }
    defaults.set(towns?[index].name, forKey: "SelectedTown")
    output?.routeToWeatherDetails()
  }
  
  func addTown() {
    output?.routeToAddTown()
  }
}


// MARK: - TownItemProtocol

private struct TownItem: TownItemProtocol {
  let name: String
}
