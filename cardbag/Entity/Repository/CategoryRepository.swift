//
//  CategoryRepository.swift
//  cardbag
//
//  Created by Anton Skorodumov on 09/11/2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import Realm

protocol ICategoryRepository {
    
    func getCategories(completionHandler: @escaping ([CategoryItem]) -> Void,
                       errorHander: @escaping (Error) -> Void)
    
}

class CategoryRepository {
    
    init() {}
    
}

extension CategoryRepository: ICategoryRepository {
    
    func getCategories(completionHandler: @escaping ([CategoryItem]) -> Void,
                       errorHander: @escaping (Error) -> Void)
    {
        let realm = try! Realm()
        
        let result = realm.objects(RCategoryItem.self)
        var ts = [CategoryItem]()
        for t in result {
            ts.append(CategoryItem(id: t.id, title: t.title))
        }
        if ts.count > 0 {
            completionHandler(ts)
            
            
            let objects = realm.objects(RCategoryItem.self)
            realm.beginWrite()
            realm.delete(objects)
            try! realm.commitWrite()
            

            
            return
        }
        
        
        var request = URLRequest(url: CardAPI.categoryList.url)
        // Настройка заголовков для запроса.
        request.httpMethod = "GET"
        
        Alamofire.request(request).responseJSON { [weak self] (response) in
            if let data = response.result.value as? AnyObject {
                if let list = CategoryList(map: data) {
                    
                    
                    var realmCategoryItems: [RCategoryItem] = []
                    for item in list.categoryList {
                        realmCategoryItems.append(RCategoryItem(id: item.id, title: item.title))
                    }
                    let realm = try! Realm()
                    realm.beginWrite()
                    for ritem in realmCategoryItems {
                        realm.add(ritem, update: true)
                    }
                    try! realm.commitWrite()
                    
                    
                    completionHandler(list.categoryList)
                } else {
                    errorHander(NSError(domain: "1", code: 1, userInfo: nil))
                }
            } else {
                errorHander(NSError(domain: "2", code: 2, userInfo: nil))
            }
        }
    }
    
}
