//
//  TownsPresenterInput.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import Foundation

protocol TownViewModelProtocol {
  var name: String { get }
}

protocol TownsPresenterInput {
  func viewDidLoad()
  func numberOfSections() -> Int
  func numberOfRowsInSection(_ section: Int) -> Int
  func townViewModel(at index: Int, in section: Int) -> TownViewModelProtocol
  func didSelectRowAtIndexPath(_ indexPath: IndexPath)
  func didTapAddButton()
  func reloadData()
}

