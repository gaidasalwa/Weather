//
//  TownsPresenter.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import Foundation

final class TownsPresenter {

  // MARK: - Property

  weak var output: TownsPresenterOutput?
  private let interactor: TownsInteractorInput
  private let router: TownsRouterProtocol

  // MARK: - Lifecycle

  init(interactor: TownsInteractorInput, router: TownsRouterProtocol) {
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - TownsPresenterInput

extension TownsPresenter: TownsPresenterInput {
  func viewDidLoad() {
    interactor.retrieve()
  }
  
  func numberOfSections() -> Int {
    interactor.numberOfCategories
  }
  
  func numberOfRowsInSection(_ section: Int) -> Int {
    interactor.numberOfItems(for: section)
  }
  
  func townViewModel(at index: Int, in section: Int) -> TownViewModelProtocol {
    guard let townItem = interactor.item(at: index, for: section) else {
          return TownViewModel(name: "")
        }
    
        return TownViewModel(name: townItem.name)
  }
  
  func didSelectRowAtIndexPath(_ indexPath: IndexPath) {
    interactor.selectItem(at: indexPath.row, for: indexPath.section)
  }
  
  func didTapAddButton() {
    interactor.addTown()
  }
  
  func reloadData() {
    interactor.retrieve()
  }
}

// MARK: - TownsInteractorOutput

extension TownsPresenter: TownsInteractorOutput {
  
  func notifyError() {
    
  }
  
  func notifyTownsList() {
    output?.updateTowns()
  }
  
  func routeToWeatherDetails() {
    router.routeToWeatherDetails()
  }
  
  func routeToAddTown() {
    router.routeToAddTown()
  }
}

// MARK: - CivilitySelectorViewModelProtocol

private struct TownViewModel: TownViewModelProtocol {
  var name: String
}
