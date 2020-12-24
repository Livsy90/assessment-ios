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
    
}
