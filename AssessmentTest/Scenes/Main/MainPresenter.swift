//
//  MainPresenter.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    var router: MainRouterProtocol! { get set }
    func configureData()
    func presentData(with data: [Notices])
    func removeData(at index: Int)
    func presentAlert()
    func selectNotice(_ notice: Notices)
}


final class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    init(view: MainViewProtocol) {
        self.view = view
    }
    
    func configureData() {
        interactor.fetchData()
    }
    
    func presentData(with data: [Notices]) {
        view?.displayData(with: data)
    }
    
    func removeData(at index: Int) {
        interactor.removeNotice(at: index)
    }
    
    func presentAlert() {
        view?.displayAlert()
    }
    
    func selectNotice(_ notice: Notices) {
        router.showEditScene(notice)
    }
    
}
