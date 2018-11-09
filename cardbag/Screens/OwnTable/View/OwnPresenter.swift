//
//  OwnPresenter.swift
//  cardbag
//
//  Created by Anton Skorodumov on 09/11/2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation

class OwnPresenter {
    
    var view: OwnTableViewInput!
    
    fileprivate var categoryRepository: ICategoryRepository!
    
    fileprivate var categoriesList: [CategoryItem] = []
    
    init(categoryRepository: ICategoryRepository) {
        self.categoryRepository = categoryRepository
    }
    
}

extension OwnPresenter: OwnTableViewOutput {
    
    func viewDidLoad() {
        categoryRepository.getCategories(completionHandler:
        { [weak self] (categoriesList) in
            self?.categoriesList = categoriesList
            self?.view.reloadData()
        }) { (error) in
            
        }
    }
    
    func numberOfRows() -> Int {
        return categoriesList.count
    }
    
    func categoryFor(row: Int) -> String {
        return categoriesList[row].title
    }
    
}
