//
//  CardsListViewController.swift
//  CardBag
//
//  Created by Admin on 12.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire

class CardsListViewController: UIViewController {
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = "test"
//        return cell
//    }
    
    @IBOutlet weak var Prob: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "text"
        let usr = UIBarButtonItem(image: UIImage( named: "user-2"), style: .plain, target: self, action: #selector(updateSampleLabel))
        
        let add = UIBarButtonItem(image: UIImage( named: "add-2"), style: .plain, target: self, action: #selector(addCard))
        navigationItem.rightBarButtonItems = [UIBarButtonItem]()
        navigationItem.rightBarButtonItems?.append(usr)
        navigationItem.rightBarButtonItems?.append(add)
        Prob.numberOfLines = 2
        Prob.text = """
        Нажмите +, чтобы
        добавить первую карту!
        """
        
    }
    
    func addCards()
    {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    @objc private func updateSampleLabel()
    {        /*let vc = UIViewController()
        vc.view.frame.size = view.frame.size
        present(vc, animated: false, completion: nil)*/
//        Alamofire.request("https://reqres.in/api/users?page=1").responseJSON { response in
//            var a: [String:Any]?
//            a = response.result.value as? [String:Any]
//            if let c = a {
//                for i in c["data"]{
//                    var n = i as? [String:Any]
//                    if let o = n {
//                        var user = User(id: o["id"], firstName: o["first_name"], lastName: o["last_name"], avatar: o["avatar"])
//                    }
//
//                }
//            }
//            
//        }
        
    }
    
    @objc private func addCard()
    {
        let add = AddCardsViewController()
        add.view.frame.size = view.frame.size
        let navCont = UINavigationController(rootViewController: add)
        self.present(navCont, animated: true, completion: nil)
        add.nav = self
        //self.present(add, animated: true, completion: self.addCards)
    }
    @IBAction func onChangeTextButton(_ sender: Any) {
        updateSampleLabel()
    }
    
}

