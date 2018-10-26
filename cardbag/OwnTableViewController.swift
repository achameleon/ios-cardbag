//
//  OwnTableViewController.swift
//  Test
//
//  Created by Anton Skorodumov on 26/10/2018.
//  Copyright © 2018 chameleon production. All rights reserved.
//

import UIKit
import Alamofire

struct TestData {
    
    var userId: Int = 0
    var title: String = ""
    var id = 0
    var complited: Bool = false
    
    init (map: [String: AnyObject]) {
        userId = map["userId"] as! Int
        title = map["title"] as! String
        id = map["id"] as! Int
        complited = map["completed"] as! Bool
    }
    
    func show() {
        print ("userId = \(userId)  title = \(title)")
    }
    
}

class OwnTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Тестовая таблица"
        tableView.delegate = self
        tableView.dataSource = self
    
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        Alamofire.request(url).responseJSON { (response) in
            if let d = response.result.value as? [String: AnyObject] {
                let object = TestData(map: d)
                object.show()
            }
        }
    
        /*
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error { return }
            guard let data = data else { return }
            let d = try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            if let dict = d as? [String: AnyObject] {
                let object = TestData(map: dict)
                object.show()
            }
        }
        task.resume()
 */
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
