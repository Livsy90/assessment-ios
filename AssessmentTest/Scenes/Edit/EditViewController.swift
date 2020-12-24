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
    func displayAlert()
}

final class EditViewController: UIViewController {
    
    var presenter: EditPresenterProtocol!
    let configurator: EditConfiguratorProtocol = EditConfigurator()
    
    lazy var keyboardHandler = {
        KeyboardHandler(viewController: self, scrollView: scrollView)
    }()
        
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var edit1: UITextField!
    @IBOutlet weak var edit2: CustomTextView!
    
    var notice: Notices?
    private let activityIndicator = ActivityIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardHandler.addKeyboardObservers()
        keyboardHandler.textInputCompletion = handleFocusOnText
        configurator.configure(with: self)
        edit1.text = notice?.noticeTitle
        edit2.text = notice?.noticeText
    }
    
    @IBAction func onClick(_ sender: Any) {
        activityIndicator.showIndicator(on: self)
        presenter.handleData(notice: notice, text: edit2.text ?? "", title: edit1.text ?? "")
    }    
    
}

extension EditViewController: EditViewProtocol {
    
    func displayResult() {
        activityIndicator.hideIndicator()
        presenter.presentDismissing()
    }
    
    func displayAlert() {
        showAlertWithOneButton(title: "Ошибка", message: "Ошибка валидации данных", buttonTitle: "Ok", buttonAction: presenter.presentDismissing)
    }
    
}

private extension EditViewController {
    
    func handleFocusOnText() {
        if let _ = edit1.firstResponder {
            scrollView.scrollRectToVisible(edit1.frame, animated: true)
        } else if let _ = edit2.firstResponder {
            scrollView.scrollRectToVisible(edit2.frame, animated: true)
        }
    }

}

    
