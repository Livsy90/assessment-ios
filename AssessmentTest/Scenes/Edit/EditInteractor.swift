//
//  EditInteractor.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit
import CoreData

protocol EditInteractorProtocol: AnyObject {
    func saveData(notice: Notices?, text: String, title: String)
}

final class EditInteractor: EditInteractorProtocol {
    
    // MARK: - Public Properties
    
    weak var presenter: EditPresenterProtocol!
    let netService = NetService.sharedInstanse
    var uC = URLComponents(string: "https://www.purgomalum.com/service/plain")
    var notice: Notices?
    
    required init(presenter: EditPresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - Business Logic
    
    func saveData(notice: Notices?, text: String, title: String) {
        self.notice = notice
        let qi = URLQueryItem(name: "text", value: title)
        uC?.queryItems = [qi]
        guard let url = uC!.url else { return }
        
        netService.getData(with: url) { (data, error) in
            switch error == nil {
            case true:
                guard let data = data else { return }
                let title = String(data: data, encoding: .utf8)
                self.notice != nil ? self.editNotice(title: title, text: text) : self.saveNewNotice(title: title, text: text)
            case false:
                self.presenter.presentValidationAlert()
            }
        }
        
    }
    
    // MARK: - Private functions
    
    private func editNotice(title: String?, text: String) {
        notice?.noticeTitle = title
        notice?.noticeText = text
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        presenter.presentDismissing()
    }
    
    private func saveNewNotice(title: String?, text: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let ent = NSEntityDescription.insertNewObject(forEntityName: "Notices", into: context) as! Notices
        ent.noticeTitle = title
        ent.noticeText = text
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        presenter.presentDismissing()
    }
    
}
