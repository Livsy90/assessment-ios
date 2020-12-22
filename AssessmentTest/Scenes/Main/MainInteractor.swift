//
//  MainInteractor.swift
//  AssessmentTest
//
//  Created by Artem on 22.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import CoreData
import UIKit

protocol MainInteractorProtocol: AnyObject {
    var data: [Notices] { get set }
    func fetchData()
    func removeNotice(at index: Int)
}

class MainInteractor: MainInteractorProtocol {
    var data: [Notices] = []
    weak var presenter: MainPresenterProtocol!
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchData() {
        data = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notices")
        do {
            let fetchResult = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fetchRequest)
            for i in 0..<fetchResult.count {
                data.append(fetchResult[i] as! Notices)
            }
            presenter.presentData(with: data)
        } catch {
            presenter.presentAlert()
        }
    }
    
    func removeNotice(at index: Int) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(data[index])
        try? context.save()
        data = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notices")
        do {
            let fetchResult = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fetchRequest)
            for i in 0..<fetchResult.count {
                data.append(fetchResult[i] as! Notices)
            }
            presenter.presentData(with: data)
        } catch {
            presenter.presentAlert()
        }
    }
    
}
