//
//  AddTownPresenter.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import Foundation

final class AddTownPresenter {

  // MARK: - Property

  weak var output: AddTownPresenterOutput?
  private let interactor: AddTownInteractorInput

  // MARK: - Lifecycle

  init(interactor: AddTownInteractorInput) {
    self.interactor = interactor
  }
}

// MARK: - TownsPresenterInput

extension AddTownPresenter: AddTownPresenterInput {
  func didTapConfirmButton(with name: String) {
    interactor.confirmAddTown(with: name)
  }
}

// MARK: - TownsInteractorOutput

extension AddTownPresenter: AddTownInteractorOutput {
  func notifyTownAdded() {
    output?.dismiss()
  }
}
