////
////  TownsPresenterTests.swift
////  WeatherTests
////
////  Created by Salwa Gaida on 17/08/2020.
////  Copyright © 2020 Salwa Gaida. All rights reserved.
////
//
//import Nimble
//import XCTest
//
//@testable import AccorHotelsApp
//
//class TownsPresenterTests: XCTestCase {
//
//  // MARK: - Property
//
//  private var presenter: TownsPresenter!
//  private var interactor: TownsInteractorInput!
//  private var output: TownsPresenterOutput!
//  private var router: TownsRouterProtocol!
//
//  // MARK: - Setup
//
//  override func setUp() {
//    super.setUp()
//    interactor = TownsInteractorInput()
//    output = TownsPresenterOutput()
//    router = TownsRouterProtocol()
//    presenter = TownsPresenter(interactor: interactor, router: router)
//    presenter.output = output
//  }
//
//  override func tearDown() {
//    presenter = nil
//    interactor = nil
//    output = nil
//    super.tearDown()
//  }
//
//  // MARK: - Tests
//
//  func test_whenPresenterViewDidLoad_thenInteractorRetrieve() {
//    // when
//    presenter.viewDidLoad()
//
//    // then
//    expect(self.interactor.retrieveCalledOnlyAndOnce).to(beTrue())
//
//    expect(self.output.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_givenNumberOfCategoriesReturnValue_whenPresenterNumberOfSections_thenInteractorCallsNumberOfCategrories() {
//    // given
//    interactor.numberOfCategories = 1
//
//    // when
//    let sectionCount = presenter.numberOfSections
//
//    // then
//    expect(sectionCount).to(equal(1))
//
//    expect(self.interactor.noMethodCalled).to(beTrue())
//    expect(self.output.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_givenNumberOfItems_whenNumberOfRows_InteractorNumberOfItems() {
//    // given
//    interactor.numberOfItemsForReturnValue = 4
//    let section = 0
//
//    // when
//    let rowCount = presenter.numberOfRows(in: section)
//
//    // then
//    expect(self.interactor.numberOfItemsForCalledOnlyAndOnce).to(beTrue())
//    expect(self.interactor.numberOfItemsForReceivedCategoryIndex).to(equal(0))
//    expect(rowCount).to(equal(4))
//
//    expect(self.output.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_givenACivilityViewModel_whenCivilityViewModel_thenInteractorCallsItem() {
//    // given
//    let expectedName = "toto"
//    let expectedCivilityItem = CivilityItemProtocolMock(name: expectedName)
//
//    interactor.itemAtForReturnValue = expectedCivilityItem
//
//    // when
//    let civility = presenter.civilityViewModel(at: 1, in: 7)
//
//    // then
//    expect(self.interactor.itemAtForCalledOnlyAndOnce).to(beTrue())
//    expect(civility.name).to(equal(expectedCivilityItem.name))
//    expect(self.interactor.itemAtForReceivedArguments?.index).to(equal(1))
//    expect(self.interactor.itemAtForReceivedArguments?.categoryIndex).to(equal(7))
//
//    expect(self.output.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_givenCivilityItemIsNil_whenCivilityViewModel_thenCivilityViewModelReturnsEmptyString() {
//    // given
//    interactor.itemAtForReturnValue = nil
//
//    // when
//    let civility = presenter.civilityViewModel(at: 0, in: 0)
//
//    // then
//    expect(civility.name).to(equal(""))
//  }
//
//  func test_givenAttributedName_whenCivilityViewModel_CivilityViewModelReturnsExpectedAttributed() {
//    // given
//    let expectedName = "toto"
//    interactor.itemAtForReturnValue = CivilityItemProtocolMock(name: expectedName)
//
//    // when
//    let nameAttributed = presenter.civilityViewModel(at: 0, in: 0)
//
//    // then
//    expect(nameAttributed.name).to(equal(expectedName))
//  }
//
//  func test_givenAnIndexAndSection_whenDidSelectCivility_InteractorSelectItem() {
//    // given
//    let index = 3
//    let section = 7
//
//    // when
//    presenter.didSelectCivility(at: index, in: section)
//
//    // then
//    expect(self.interactor.selectItemAtForCalledOnlyAndOnce).to(beTrue())
//    expect(self.interactor.selectItemAtForReceivedArguments?.index).to(equal(3))
//    expect(self.interactor.selectItemAtForReceivedArguments?.categoryIndex).to(equal(7))
//
//    expect(self.output.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_whenDidtapBackButton_thenInteractotQuit() {
//    // when
//    presenter.didTapToQuit()
//
//    // then
//    expect(self.interactor.quitCalledOnlyAndOnce).to(beTrue())
//
//    expect(self.output.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_givenExpectedCancelItem_whenSetDefaultValues_thenOutputDisplaysCancelButtonTitleAndReceivesExpectedArguments() {
//    // when
//    presenter.setDefaultValues()
//
//    // then
//    expect(self.output.displayCancelButtonCallsCount).to(equal(1))
//    expect(self.output.displayCancelButtonReceivedItem?.title).to(equal(L10n.Civilities.List.Cancel.Button.title))
//    expect(self.output.displayCancelButtonReceivedItem?.style).to(equal(.done))
//    expect(self.output.displayDoneButtonCallsCount).to(equal(1))
//    expect(self.output.displayDoneButtonReceivedItem?.title).to(equal(L10n.Civilities.List.Done.Button.title))
//    expect(self.output.displayDoneButtonReceivedItem?.style).to(equal(.done))
//
//    expect(self.interactor.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_whenNotifyLoading_thenOutputShowLoadingIndicator() {
//    // when
//    presenter.notifyLoading()
//
//    // then
//    expect(self.output.showLoadingIndicatorCalledOnlyAndOnce).to(beTrue())
//
//    expect(self.interactor.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_givenAnExpectedErrorMessage_whenNotifyServerError_thenOutputReceiveExpectedErrorMessage() {
//    // given
//    let expectedMessage = NSAttributedString(string: L10n.Civilities.List.Server.Error.message)
//
//    // when
//    presenter.notifyServerError()
//
//    // then
//    expect(self.output.displayErrorWithMessageCalledOnlyAndOnce).to(beTrue())
//    expect(self.output.displayErrorWithMessageReceivedWithMessage).to(equal(expectedMessage))
//
//    expect(self.interactor.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_givenAnExpectedErrorMessage_whenNotifyNetworkError_thenOutputReceiveExpectedErrorMessage() {
//    // given
//    let expectedMessage = NSAttributedString(string: L10n.Civilities.List.Network.Error.message)
//
//    // when
//    presenter.notifyNetworkError()
//
//    // then
//    expect(self.output.displayErrorWithMessageCalledOnlyAndOnce).to(beTrue())
//    expect(self.output.displayErrorWithMessageReceivedWithMessage).to(equal(expectedMessage))
//
//    expect(self.interactor.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_givenAnExpectedErrorMessage_whenNoDataError_thenOutputReceiveExpectedErrorMessage() {
//    // given
//    let expectedMessage = NSAttributedString(string: L10n.Civilities.List.Nodata.Error.message)
//
//    // when
//    presenter.notifyNoDataError()
//
//    // then
//    expect(self.output.displayErrorWithMessageCalledOnlyAndOnce).to(beTrue())
//    expect(self.output.displayErrorWithMessageReceivedWithMessage).to(equal(expectedMessage))
//
//    expect(self.interactor.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_whenNotifyCivilityUpdate_thenOuptutDelegateCivilitySelection() {
//    // when
//    presenter.notifyCurrentCivilityUpdate()
//
//    // then
//    expect(self.output.updateCurrentCivilityCalledOnlyAndOnce).to(beTrue())
//
//    expect(self.interactor.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_whenUpdateCivilities_thenOuputHideLoadingIndicatorAndReloadData() {
//    // when
//    presenter.updateCivilities()
//
//    // then
//    expect(self.output.reloadDataCallsCount).to(equal(1))
//    expect(self.output.hideLoadingIndicatorCallsCount).to(equal(1))
//    expect(self.output.displayCancelButtonCalled).to(beFalse())
//    expect(self.output.displayErrorWithMessageCalled).to(beFalse())
//    expect(self.output.showLoadingIndicatorCalled).to(beFalse())
//    expect(self.output.updateCurrentCivilityCalled).to(beFalse())
//
//    expect(self.interactor.noMethodCalled).to(beTrue())
//    expect(self.router.noMethodCalled).to(beTrue())
//  }
//
//  func test_whenRouteBack_thenRouterRouteBack() {
//    // when
//    presenter.routeBack()
//
//    // then
//    expect(self.router.routeBackCalledOnlyAndOnce).to(beTrue())
//
//    expect(self.interactor.noMethodCalled).to(beTrue())
//    expect(self.output.noMethodCalled).to(beTrue())
//  }
//}
