//
//  UIViewController+adds.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlertWithOneButton(title: String, message: String?, buttonTitle: String, buttonAction: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: buttonTitle, style: .default) { (_) in
            buttonAction?()
        }
        
        alertController.addAction(alertButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
