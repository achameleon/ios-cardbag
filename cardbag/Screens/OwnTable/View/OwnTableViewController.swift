//
//  OwnTableViewController.swift
//  Test
//
//  Created by Anton Skorodumov on 26/10/2018.
//  Copyright © 2018 chameleon production. All rights reserved.
//

import UIKit

class OwnTableViewController: UIViewController {
    
    var presenter: OwnTableViewOutput!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Тестовая таблица"
        tableView.dataSource = self
        presenter.viewDidLoad()
    }

}

extension OwnTableViewController: OwnTableViewInput {
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

extension OwnTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryName = presenter.categoryFor(row: indexPath.row)
        let cell = UITableViewCell()
        cell.textLabel?.text = categoryName
        return cell
    }
    
}
