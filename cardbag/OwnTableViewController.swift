//
//  OwnTableViewController.swift
//  Test
//
//  Created by Anton Skorodumov on 26/10/2018.
//  Copyright © 2018 chameleon production. All rights reserved.
//

import UIKit
import Alamofire

struct Jsonplaceholder: Codable {
    
    var userId: Int = 0
    var id: Int = 0
    var title: String = ""
    var completed: Bool = false
    
}

struct CategoryItem: Codable {
    
    var id: Int = 0
    var title: String = ""
    
}

struct CategoryList: Codable {
    
    var categoryList: [CategoryItem] = []
    
    enum CodingKeys: String, CodingKey {
        case categoryList
    }
    
    func show() {
        
    }
    
}

class OwnTableViewController: UIViewController {
    
    let keyStorage: KeyStorage = KeyStorage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Тестовая таблица"
        tableView.delegate = self
        tableView.dataSource = self
        
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Ok", style: .default) { (_) in
            print ("Ok")
        }
        
        let action2 = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            print ("Cancel")
        }
        
        alert.addAction(action1)
        alert.addAction(action2)

        Alamofire.request(CardAPI.categoryList.url).responseJSON { (response) in
            if let d = response.data {
                
            }
        }
        
        print (keyStorage.userId)
        print (keyStorage.title)
        
        Alamofire.request(URL(string: "https://jsonplaceholder.typicode.com/todos/1")!).responseJSON
        { [weak self] (response) in
            if let d = response.data {
                do {
                    let object = try JSONDecoder().decode(Jsonplaceholder.self, from: d)
                    self?.keyStorage.userId = object.userId
                    self?.keyStorage.title = object.title
                } catch {
                    print (error)
                }
            }
        }
        
    
    }

}

extension OwnTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension OwnTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        indexPath.row
        indexPath.section
        return UITableViewCell()
    }
    
}
