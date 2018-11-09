//
//  OwnConfigurator.swift
//  cardbag
//
//  Created by Anton Skorodumov on 09/11/2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation

class OwnConfigurator {
    
    static func controller() -> OwnTableViewController {
        
        let categoryRepository: ICategoryRepository = CategoryRepository()
        
        let viewController = OwnTableViewController()
        
        let presenter = OwnPresenter(categoryRepository: categoryRepository)
        
        viewController.presenter = presenter
        presenter.view = viewController
        
        return viewController
        
    }
    
}
