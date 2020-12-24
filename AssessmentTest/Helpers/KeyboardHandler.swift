//
//  KeyboardHandler.swift
//  AssessmentTest
//
//  Created by Artem on 23.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit

final class KeyboardHandler {
    
    // MARK: - Public Properties
    
    var textInputCompletion: (() -> ())?
    
    // MARK: - Private Properties
    
    private unowned let viewController: UIViewController
    private unowned let scrollView: UIScrollView
    
    // MARK: - Initializers
    
    init(viewController: UIViewController, scrollView: UIScrollView) {
        self.viewController = viewController
        self.scrollView = scrollView
    }
    
    // MARK: - Public Methods
    
    func addKeyboardObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    // MARK: - Private Methods
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        adjustInsetForKeyboardShow(isShow: true, notification: notification)
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        adjustInsetForKeyboardShow(isShow: false, notification: notification)
    }
    
    private func adjustInsetForKeyboardShow(isShow: Bool, notification: NSNotification) {
        if isShow {
            let userInfo: NSDictionary = notification.userInfo! as NSDictionary
            let keyboardInfo = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue
            let keyboardSize = keyboardInfo.cgRectValue.size
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            textInputCompletion?()
        } else {
            scrollView.contentInset = .zero
        }
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
}
