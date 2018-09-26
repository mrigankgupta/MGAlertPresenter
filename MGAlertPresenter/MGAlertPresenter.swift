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
    var style: UIAlertControllerStyle// can use our own enum, but it might not require
    var actions: [AlertAction]?
}

public struct AlertAction {
    var title: String?
    var style: UIAlertActionStyle
    var handler: ((String?) -> Void)?
}

protocol Alertable {
    func showAlert(from: UIViewController, data: AlertData, animated: Bool, completion: (() -> Void)?)
    func dismiss(from: UIViewController, animated: Bool, completion: (() -> Void)?)
}

extension Alertable {

    func showAlert(from: UIViewController, data: AlertData, animated: Bool,
                   completion: (() -> Void)?) {
        let alert = UIAlertController(title: data.title, message: data.message, preferredStyle: data.style)
        if let actions = data.actions {
            for action in actions {
                let alertAction = UIAlertAction(title: action.title, style: action.style) { (alertAction) in
                    action.handler?(alertAction.title)
                }
                alert.addAction(alertAction)
            }
        }
        from.present(alert, animated: animated, completion: completion)
    }

    func dismiss(from: UIViewController, animated: Bool,
                 completion: (() -> Void)?) {
        from.dismiss(animated: animated, completion: completion)
    }
}

class AlertPresenter: Alertable {
    // Override methods for your implementation
}
