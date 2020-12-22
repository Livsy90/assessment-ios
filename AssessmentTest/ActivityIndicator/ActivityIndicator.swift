//
//  ActivityIndicator.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit

struct ActivityIndicator {
    
    // MARK: Public Properties
    
    let activityIndicator = UIActivityIndicatorView()
    
    // MARK: Public Methods

    func showIndicator(on viewController: UIViewController) {
        activityIndicator.center = viewController.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        viewController.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideIndicator() {
        activityIndicator.stopAnimating()
    }
    
}
