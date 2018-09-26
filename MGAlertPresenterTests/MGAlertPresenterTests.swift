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
    var alertData: AlertData?
    func showAlert(from: UIViewController, data: AlertData, animated: Bool,
                   completion: (() -> Void)?) {
        showAlertWasCalled = true
        alertData = data
    }

    func dismiss(from: UIViewController, animated: Bool,
                 completion: (() -> Void)?) {
        dismissWasCalled = true
    }
}

class MGAlertPresenterTests: XCTestCase {

    var counterController: CounterController!
    var dummyAlert = DummyAlerter()

    override func setUp() {
        super.setUp()
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
        counterController = storyBoard.instantiateViewController(withIdentifier: "CounterController") as? CounterController
        UIApplication.shared.keyWindow!.rootViewController = counterController
        
        let _ = counterController.view
        counterController.replace(presenter: dummyAlert)
    }
    
    override func tearDown() {
        counterController = nil
        super.tearDown()
    }

    func testShowAlert() {
        counterController.showIncrementAlert(self)
        XCTAssertTrue(dummyAlert.showAlertWasCalled)
        XCTAssertEqual(dummyAlert.alertData?.title, Global.Alert.title)
        XCTAssertEqual(dummyAlert.alertData?.message, Global.Alert.message)
        XCTAssertEqual(dummyAlert.alertData?.actions![0].title, Global.Alert.buttonTitles[0])
        XCTAssertEqual(dummyAlert.alertData?.actions![1].title, Global.Alert.buttonTitles[1])
    }
    
}
