//
//  EditConfigurator.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import Foundation

protocol EditConfiguratorProtocol: AnyObject {
    func configure(with viewController: EditViewController)
}

final class EditConfigurator: EditConfiguratorProtocol {
    
    func configure(with viewController: EditViewController) {
        let presenter = EditPresenter(view: viewController)
        let interactor = EditInteractor(presenter: presenter)
        let router = EditRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
