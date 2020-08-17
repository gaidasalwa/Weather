//
//  TownsInteractorInput.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import Foundation

public protocol TownItemProtocol {
  var name: String { get }
}

public protocol TownsInteractorInput {
  var output: TownsInteractorOutput? { get set }
  func retrieve()
  var numberOfCategories: Int { get }
  func numberOfItems(for categoryIndex: Int) -> Int
  func item(at index: Int, for categoryIndex: Int) -> TownItemProtocol?
  func selectItem(at index: Int, for categoryIndex: Int)
  func addTown()
}
