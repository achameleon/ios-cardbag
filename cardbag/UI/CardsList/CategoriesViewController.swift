//
//  CategoriesViewController.swift
//  CardBag
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblCategories: UITableView!
    
    var categArray = [TestData]()
    var filteredCategories = [TestData]()
    let searchController = UISearchController(searchResultsController: nil)
    
    struct TestData {
        
        var id = 0
        var title: String = ""
        let p = CategoriesViewController()
        
        init (map: AnyObject) {
            id = map["id"] as! Int
            title = map["title"] as! String
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
        let categ: TestData
        categ = filteredCategories[indexPath.row]
        cell.textF.text = categ.title
        return cell
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
        
        let url = URL(string: "http://cardbag.ru/api/categories")!
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let d = response.result.value as? AnyObject {
                for i in 0..<d.count {
                    let object = TestData(map: d[i])
                    self.categArray.append(object)
                    self.filteredCategories.append(object)
                    self.tblCategories.reloadData()
                }
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
        if searchBarIsEmpty() {
            filteredCategories = categArray
        } else {
            filteredCategories = categArray.filter({(categ: TestData) -> Bool in
                return categ.title.lowercased().contains(searchText.lowercased())
            })
            searchController.searchBar.text = searchText
        }
        tblCategories.reloadData()
    }
}
