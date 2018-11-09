//
//  CategoriesViewController.swift
//  CardBag
//
//  Created by Admin on 25.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tblCategories: UITableView!
    
    var categArray = [TestData]()
    
    struct TestData {
        
        var id = 0
        var title: String = ""
        let p = CategoriesViewController()
        
        init (map: AnyObject){
            id = map["id"] as! Int
            title = map["title"] as! String
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
        cell.textF.text = categArray[indexPath.row].title
        return cell
    }
    
    func searchbar(){
        
        //let searchController = UISearchController(searchResultsController: nil)
        //navigationItem.searchController = searchController
        //navigationItem.hidesSearchBarWhenScrolling = false
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Поиск карты или категории"
        searchBar.frame = CGRect(x: 0, y: 100, width: (navigationController?.view.bounds.size.width)!, height: 32)
        searchBar.barTintColor = .white
        //      searchBar.
        view.addSubview(searchBar)
        searchBar.delegate = self
        // self.navigationItem.titleView = searchBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "MyCustomCell", bundle: nil)
        tblCategories.tableFooterView = UIView(frame: .zero)
        self.tblCategories.register(nib, forCellReuseIdentifier: "MyCustomCell")
        navigationItem.title = "Выбрать категорию"
       
       searchbar()
        
        let url = URL(string: "http://cardbag.ru/api/categories")!
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let d = response.result.value as? AnyObject {
                for i in 0..<d.count {
                    let object = TestData(map: d[i])
                    self.categArray.append(object)
                    self.tblCategories.reloadData()
                }
            }
        }
    
        
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
