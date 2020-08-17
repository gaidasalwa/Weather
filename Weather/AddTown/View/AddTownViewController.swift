//
//  AddTownViewController.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import UIKit

class AddTownViewController: UIViewController {
  
  var presenter: AddTownPresenterInput!
  
  // MARK: - Outlets

  @IBOutlet private weak var townNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        let interactor = AddTownInteractor()
        let townPresenter = AddTownPresenter(interactor: interactor)
      townPresenter.output = self
        interactor.output = townPresenter
        presenter = townPresenter
    }
    
  // MARK: - IBActions

  @IBAction private func didTapConfirmAddButton() {
    guard let cityName = townNameTextField.text,
      !cityName.isEmpty else {
      return
    }
    presenter.didTapConfirmButton(with: cityName)
  }
}

// MARK: - AddTownPresenterOutput

extension AddTownViewController: AddTownPresenterOutput {
  func dismiss() {
    self.dismiss(animated: true, completion: nil)
  }
}
