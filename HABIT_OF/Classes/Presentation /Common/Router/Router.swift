//
//  Router.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 28/02/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

protocol Router {
    
    var presenter: UIViewController? { get }
    
}

extension Router {
    
    func show(viewController: UIViewController) {
        guard let presenter = presenter else {
            return
        }
        presenter.show(viewController, sender: nil)
    }
    
    func presentModally(viewController: UIViewController, animated: Bool = true) {
        guard let presenter = presenter else {
            return
        }
        viewController.modalPresentationStyle = .overCurrentContext
        presenter.present(viewController, animated: animated, completion: nil)
    }
    
    func dismiss(animated: Bool = true) {
        presenter?.dismiss(animated: animated, completion: nil)
    }
    
    func pop(animated: Bool = true) {
        presenter?.navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        if let nav = presenter as? UINavigationController {
            nav.popToRootViewController(animated: animated)
        } else {
            presenter?.navigationController?.popToRootViewController(animated: animated)
        }
    }
}
