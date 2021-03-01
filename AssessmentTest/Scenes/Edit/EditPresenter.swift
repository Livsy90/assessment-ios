//
//  EditPresenter.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import Foundation

protocol EditPresenterProtocol: AnyObject {
    var router: EditRouterProtocol! { get set }
    func handleData(notice: Notices?, text: String, title: String)
    func presentDismissing()
    func presentResult()
    func presentEmptyTextAlert()
    func presentValidationAlert()
}


final class EditPresenter: EditPresenterProtocol {
    
    // MARK: - Public Properties
    
    weak var view: EditViewProtocol!
    var interactor: EditInteractorProtocol!
    var router: EditRouterProtocol!
    
    init(view: EditViewProtocol) {
        self.view = view
    }
    
    // MARK: - PresentationLogic
    
    func handleData(notice: Notices?, text: String, title: String) {
        interactor.saveData(notice: notice, text: text, title: title)
    }
    
    func presentDismissing() {
        router.dismissSelf()
    }
    
    func presentResult() {
        view?.displayResult()
    }
    
    func presentEmptyTextAlert() {
        router.routeToAlert(title: "Заголовок не может быть пустым", message: "", action: nil)
    }
    
    func presentValidationAlert() {
        router.routeToAlert(title: "Ошибка", message: "Ошибка валидации данных", action: presentDismissing)
    }
    
}
