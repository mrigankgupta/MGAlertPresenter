//
//  CounterController.swift
//  MGAlertPresenter
//
//  Created by Gupta, Mrigank on 13/09/18.
//  Copyright © 2018 Gupta, Mrigank. All rights reserved.
//

import UIKit

class CounterController: UIViewController {
    
    @IBOutlet weak var pressCounter: UIButton!
    @IBOutlet weak var count: UILabel!
    var alertPresenter: Alertable!

    private var pressedCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        alertPresenter = AlertPresenter()
        count.text = "\(pressedCount)"
    }

    @IBAction func showIncrementAlert(_ sender: Any) {
        let okAction = AlertAction(title: Global.Alert.buttonTitles[0], style: .default) { (title) in
            self.increment()
        }
        let cancelAction = AlertAction(title: Global.Alert.buttonTitles[1], style: .destructive, handler: nil)

        let alertData = AlertData(title: Global.Alert.title, message: Global.Alert.message, style: .alert, actions: [okAction, cancelAction])
        alertPresenter.showAlert(from: self, data: alertData, animated: false, completion: nil)
    }

    func increment() {
        self.pressedCount += 1
        count.text = "\(pressedCount)"
    }
}

