//
//  MGAlertPresenterTests.swift
//  MGAlertPresenterTests
//
//  Created by Gupta, Mrigank on 13/09/18.
//  Copyright © 2018 Gupta, Mrigank. All rights reserved.
//

import XCTest
@testable import MGAlertPresenter

extension CounterController {
    func replace(presenter: Alertable) {
        self.alertPresenter = presenter
    }
}

class DummyAlerter: Alertable {
    var dismissWasCalled = false
    var showAlertWasCalled = false
    func showAlert(from: UIViewController, data: AlertData, animated: Bool,
                   completion: (() -> Void)?) {
        
    }

    func dismiss(from: UIViewController, animated: Bool,
                 completion: (() -> Void)?) {

    }
}

class MGAlertPresenterTests: XCTestCase {

    var counterController: CounterController!
    var expectation: XCTestExpectation!
    var dummyAlert = DummyAlerter()

    override func setUp() {
        super.setUp()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        counterController = storyBoard.instantiateViewController(withIdentifier: "CounterController") as? CounterController
        let _ = counterController.view
        counterController.replace(presenter: dummyAlert)
    }
    
    override func tearDown() {
        counterController = nil
        super.tearDown()
    }
    
    func testShowAlert() {
        counterController.showIncrementAlert(self)
//        expectation = XCTestExpectation(description: "DummyAlertCalled")
    }
    
}
