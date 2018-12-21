//
//  CardsListViewController.swift
//  CardBag
//
//  Created by Admin on 12.10.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire

class CardsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var Prob: UILabel!
    @IBOutlet weak var TableView: UITableView!

    var cards:[Card] = []

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell

        cell.setDatas(Name: "Lenta" ,ClassCard: "dfdfd", Discount: "dff", Front: UIImage.init(named: "Card") , Back: UIImage.init(named: "Card") )
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView) -> UITableViewCell {
        let cell = TableViewCell()
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.tableFooterView = UIView()
        TableView.delegate = self
        navigationItem.title = "CARDbag"
        let usr = UIBarButtonItem(image: UIImage( named: "userActive"), style: .plain, target: self, action: #selector(userAction))
        
        if cards.count == 0  {
            //self.TableView.isHidden = true
            
        }
        let nib = UINib(nibName: "TableViewCell", bundle: Bundle.main)
        TableView.register(nib, forCellReuseIdentifier: "cell")
        TableView.dataSource = self
        let add = UIBarButtonItem(image: UIImage( named: "addActive"), style: .plain, target: self, action: #selector(addCard))
        navigationItem.rightBarButtonItems = [UIBarButtonItem]()
        navigationItem.rightBarButtonItems?.append(usr)
        navigationItem.rightBarButtonItems?.append(add)
        Prob.numberOfLines = 2
        Prob.text = """
        Нажмите +, чтобы
        добавить первую карту!
        """
        
        Alamofire.request("http://cardbag.ru/api/cards").responseJSON { [weak self] response in
            var a: [AnyObject]?
            a = response.result.value as? [AnyObject]
            if let c = a {
                for i in c {
                    self?.cards.append(Card(a: i))
                }
            }
        }
    }
    
    func addCards()
    {
        
    }
    
    func logIn(action: UIAlertAction) {
        let controller = LoginViewController()
        let NavigationController = UINavigationController(rootViewController: controller)
        navigationController?.present(NavigationController, animated: true, completion: nil)
    }
    func register(action: UIAlertAction) {
        
    }
    func cancel(action: UIAlertAction) {
        self.dismiss(animated: true, completion: nil)
    }
	
    @objc private func userAction()
    {
        if UserDefaults.standard.string(forKey: "accesstoken") == nil
        {
            let alert = UIAlertController(title: nil,
                                          message: nil,
                                          preferredStyle: UIAlertControllerStyle.actionSheet)
            alert.title  = "Вы еще не зарегистрированы"
            let logIn = UIAlertAction(title: "Войти",
                                      style: UIAlertActionStyle.default, handler: self.logIn)
            let register = UIAlertAction(title: "Зарегистрироваться",
                                         style: UIAlertActionStyle.default, handler: self.register)
            let cancel = UIAlertAction(title: "Отмена",
                                       style: UIAlertActionStyle.cancel, handler: self.cancel)
            alert.addAction(logIn)
            alert.addAction(register)
            alert.addAction(cancel)
            if let popoverController = alert.popoverPresentationController {
                popoverController.sourceView = view
            }
            self.present(alert, animated: true)
        }
        else
        {
            let controller = ProfileViewController()
            let NavigationController = UINavigationController(rootViewController: controller)
            navigationController?.present(NavigationController, animated: true, completion: nil)
        }
    }
    
    @objc private func addCard() {
        let addPage = AddCard()
        let navigation = UINavigationController(rootViewController: addPage)
        let closeButton = UIBarButtonItem(image: UIImage(named: "closeActive"), style: .plain, target: self, action: #selector(close))
        
        addPage.navigationItem.title = "Добавить карту"
        addPage.navigationItem.leftBarButtonItem = closeButton
        navigationController?.present(navigation, animated: true, completion: nil)
    }
    
    @IBAction func onChangeTextButton(_ sender: Any) {
        userAction()
    }
    
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
    
}

