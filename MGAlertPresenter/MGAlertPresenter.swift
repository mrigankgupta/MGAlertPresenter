//
//  MGAlertPresenter.swift
//  MGAlertPresenter
//
//  Created by Gupta, Mrigank on 23/09/18.
//  Copyright © 2018 Gupta, Mrigank. All rights reserved.
//

import Foundation
import UIKit

public struct AlertData {
    var title: String?
    var message: String?
    var style: UIAlertControllerStyle
    var actions: [AlertAction]?
}

public struct AlertAction {
    var title: String?
    var style: UIAlertActionStyle
    var handler: ((String?) -> Void)?
}

protocol Alertable where Self: UIViewController {
    func showAlert(data: AlertData, animated: Bool, completion: (() -> Void)?)
    func dismiss()
}

extension Alertable {

    func showAlert(data: AlertData, animated: Bool, completion: (() -> Void)?) {
        let alert = UIAlertController(title: data.title, message: data.message, preferredStyle: data.style)
        if let actions = data.actions {
            for action in actions {
                let alertAction = UIAlertAction(title: action.title, style: action.style) { (alertAction) in
                    action.handler?(alertAction.title)
                }
                alert.addAction(alertAction)
            }
        }
        self.present(alert, animated: animated, completion: completion)
    }

    func dismiss() {
        self.dismiss()
    }
}
