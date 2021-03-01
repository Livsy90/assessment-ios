//
//  EditViewController.swift
//  AssessmentTest
//
//  Created by Михаил Юранов on 02.10.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit
import CoreData

protocol EditViewProtocol: AnyObject {
    func displayResult()
}

final class EditViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var edit1: UITextField!
    @IBOutlet weak var edit2: DesignableTextView!
    
    // MARK: - Public Properties
    
    let configurator: EditConfiguratorProtocol = EditConfigurator()
    var presenter: EditPresenterProtocol!
    var notice: Notices?
    lazy var keyboardHandler = {
        KeyboardHandler(viewController: self, scrollView: scrollView)
    }()
    
    // MARK: - Private Properties
    
    private let activityIndicator = ActivityIndicator()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardHandler.addKeyboardObservers()
        keyboardHandler.textInputCompletion = handleFocusOnText
        configurator.configure(with: self)
        view.hideKeyboardOnTap()
        edit1.text = notice?.noticeTitle
        edit2.text = notice?.noticeText
    }
    
    @IBAction func onClick(_ sender: Any) {
        switch edit1.text?.isEmpty {
        case true:
            presenter.presentEmptyTextAlert()
        default:
            finishEditing()
        }
    }    
    
}

// MARK: - Display Logic

extension EditViewController: EditViewProtocol {
    
    func displayResult() {
        activityIndicator.hideIndicator()
        presenter.presentDismissing()
    }
    
}

// MARK: - Private Methods

private extension EditViewController {
    
    func handleFocusOnText() {
        if let _ = edit1.firstResponder {
            scrollView.scrollRectToVisible(edit1.frame, animated: true)
        } else if let _ = edit2.firstResponder {
            scrollView.scrollRectToVisible(edit2.frame, animated: true)
        }
    }
    
    func finishEditing() {
        activityIndicator.showIndicator(on: self)
        presenter.handleData(notice: notice, text: edit2.text ?? "", title: edit1.text ?? "")
    }
    
}


