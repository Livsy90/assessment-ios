//
//  MainRouter.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    func routeToEdit(_ sender: Notices)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
    func routeToAlert(title: String, message: String, action: (() -> Void)?)
}

final class MainRouter: MainRouterProtocol {
    
    // MARK: - Public Properties
    
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Routing Logic
    
    func routeToEdit(_ sender: Notices) {
        viewController.performSegue(withIdentifier: viewController.selfToEditSegueName, sender: sender)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == viewController.selfToEditSegueName {
            let vc = segue.destination as! EditViewController
            vc.notice = sender as? Notices
        }
    }
    
    func routeToAlert(title: String, message: String, action: (() -> Void)?) {
        viewController.showAlertWithOneButton(title: title, message: message, buttonTitle: "Ok", buttonAction: action)
    }
    
}
