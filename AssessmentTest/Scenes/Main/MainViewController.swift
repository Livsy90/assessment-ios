//
//  ViewController.swift
//  AssessmentTest
//
//  Created by Михаил Юранов on 02.10.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func displayData(with data: [Notices])
}

final class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public Properties
    
    let configurator: MainConfiguratorProtocol = MainConfigurator()
    let selfToEditSegueName = "goToEdit"
    var presenter: MainPresenterProtocol!
    var data: [Notices] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        configurator.configure(with: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.fetchData()
    }
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row].noticeTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notice = data[indexPath.row]
        presenter.selectNotice(notice)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        presenter.removeData(at: indexPath.row)
    }
    
    // MARK: - Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        presenter.router.prepare(for: segue, sender: sender)
    }
    
}

    // MARK: - Display Logic

extension MainViewController: MainViewProtocol {
    
    func displayData(with data: [Notices]) {
        self.data = data
        tableView.reloadData()
    }
    
}
