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
        let qi = URLQueryItem(name: "text", value: text)
        uC?.queryItems = [qi]
        
        netService.getData(with: uC!.url!) { (data, error) in
            switch error == nil {
            case true:
                let str = String(data: data!, encoding: .utf8)
                self.notice != nil ? self.editNotice(str: str, title: title) : self.saveNewNotice(str: str, text: text)
            case false:
                self.presenter.presentAlert()
            }
        }
        
    }
    
    // MARK: - Private functions
    
    private func editNotice(str: String?, title: String) {
        self.notice?.noticeTitle = title
        self.notice?.noticeText = str
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.presenter.presentDismissing()
    }
    
    private func saveNewNotice(str: String?, text: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let ent = NSEntityDescription.insertNewObject(forEntityName: "Notices", into: context) as! Notices
        ent.noticeTitle = text
        ent.noticeText = str
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.presenter.presentDismissing()
    }
    
}

