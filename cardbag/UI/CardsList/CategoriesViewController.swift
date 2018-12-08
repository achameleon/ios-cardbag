//
//  CategoriesViewController.swift
//  CardBag
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit
import Alamofire
import Realm
import RealmSwift

protocol CategoriesChangeDelegate: class {
    
    func provideCategory(item: CategoryList)
    
}

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblCategories: UITableView!
    
    var delegate: CategoriesChangeDelegate?
    
    var categArray = [CategoryList]()
    var filteredCategories = [CategoryList]()
    let searchController = UISearchController(searchResultsController: nil)
    var searchField: String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
        let categ: CategoryList!
        categ = filteredCategories[indexPath.row]
        cell.textF.text = categ.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = filteredCategories[indexPath.row]
        delegate?.provideCategory(item: object)
        navigationController?.popViewController(animated: true)
    }
    
    func setupSearchBar() {
        searchController.searchBar.placeholder = "Поиск категории"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    func searchBarIsEmpty()	-> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "MyCustomCell", bundle: nil)
        tblCategories.tableFooterView = UIView(frame: .zero)
        self.tblCategories.register(nib, forCellReuseIdentifier: "MyCustomCell")
        navigationItem.title = "Выбрать категорию"
        setupSearchBar()
        
        let realm = try! Realm()
        
        let result = realm.objects(RCategoryItem.self)
        var ts = [CategoryList]()
        for t in result {
            ts.append(CategoryList(id: t.id, title: t.title))
        }
        if ts.count > 0 {
            categArray = ts
            filteredCategories = ts
            tblCategories.reloadData()
        }
        
        let url = URL(string: "http://cardbag.ru/api/categories")!
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let d = response.result.value as? AnyObject {
                realm.beginWrite()
                for i in 0..<d.count {
                    guard let object = CategoryList(map: d[i]) else {continue}
                    self.categArray.append(object)
                    self.filteredCategories.append(object)
                    self.tblCategories.reloadData()
                    realm.add(RCategoryItem(id: object.id, title: object.title), update: true)
                }
                try! realm.commitWrite()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}


extension CategoriesViewController: UISearchBarDelegate {
 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchField = searchText
        if searchBarIsEmpty() {
            filteredCategories = categArray
        } else {
            filteredCategories = categArray.filter({(categ: CategoryList) -> Bool in
                return categ.title.lowercased().contains(searchText.lowercased())
            })
        }
        tblCategories.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchController.searchBar.text = searchField
    }
    
}

