//
//  MainRouter.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    func showEditScene(_ sender: Notices)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

final class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func showEditScene(_ sender: Notices) {
        viewController.performSegue(withIdentifier: viewController.selfToEditSegueName, sender: sender)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == viewController.selfToEditSegueName {
            let vc = segue.destination as! EditViewController
            vc.notice = sender as? Notices
        }
    }
    
}
