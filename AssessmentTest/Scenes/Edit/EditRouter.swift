//
//  EditRouter.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit

protocol EditRouterProtocol: AnyObject {
    func dismissSelf()
    func routeToAlert(title: String, message: String, action: (() -> Void)?)
}

final class EditRouter: EditRouterProtocol {
    
    // MARK: - Public Properties
    
    weak var viewController: EditViewController!
    
    init(viewController: EditViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Routing Logic
    
    func dismissSelf() {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func routeToAlert(title: String, message: String, action: (() -> Void)?) {
        viewController.showAlertWithOneButton(title: title, message: message, buttonTitle: "Ok", buttonAction: action)
    }
    
}
