//
//  CategoryRepository.swift
//  cardbag
//
//  Created by Anton Skorodumov on 09/11/2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation
import Alamofire

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
        var request = URLRequest(url: CardAPI.categoryList.url)
        // Настройка заголовков для запроса.
        request.httpMethod = "GET"
        print (request.allHTTPHeaderFields)
        request.allHTTPHeaderFields = ["token":"accessToken"]
        print (request.allHTTPHeaderFields)
        
        Alamofire.request(request).responseJSON { [weak self] (response) in
            if let data = response.result.value as? AnyObject {
                if let list = CategoryList(map: data) {
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
