//
//  MainConfigurator.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import Foundation

protocol MainConfiguratorProtocol: AnyObject {
    func configure(with viewController: MainViewController)
}

final class MainConfigurator: MainConfiguratorProtocol {
    
    func configure(with viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
