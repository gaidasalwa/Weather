//
//  TownsViewController.swift
//  Weather
//
//  Created by Salwa Gaida on 17/08/2020.
//  Copyright © 2020 Salwa Gaida. All rights reserved.
//

import UIKit

class TownsViewController: UITableViewController {
  
  let cellReuseIdentifier = "cell"
  
  var presenter: TownsPresenterInput!

  override func viewDidLoad() {
    super.viewDidLoad()
    let interactor = TownsInteractor()
    let router = TownsRouter()
    let townPresenter = TownsPresenter(interactor: interactor, router: router)
    interactor.output = townPresenter
    presenter = townPresenter
    configureView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.viewDidLoad()
  }
  
  func configureView() {
      navigationItem.title = "Towns List"
      
    let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(TownsViewController.didTapAddButton))
      
      navigationItem.rightBarButtonItem = addItem
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
  }
  
  @objc func didTapAddButton () {
    presenter.didTapAddButton()
  }
  
  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return presenter.numberOfSections()
  }
  
  

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfRowsInSection(section)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let town = presenter.townViewModel(at: indexPath.row, in: indexPath.section)
    let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
    
    cell.textLabel?.text = town.name
    
    return cell
  }
  
  // MARK: - Table view delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.didSelectRowAtIndexPath(indexPath)
  }
}

// MARK: - AddTownPresenterOutput

extension TownsViewController: TownsPresenterOutput {
  func reloadData() {
    presenter.reloadData()
    tableView.reloadData()
  }
  
  func updateTowns() {
    tableView.reloadData()
  }
}
