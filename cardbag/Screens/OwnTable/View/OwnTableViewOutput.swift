//
//  OwnTableOutput.swift
//  cardbag
//
//  Created by Anton Skorodumov on 09/11/2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import Foundation

protocol OwnTableViewOutput {
    
    func viewDidLoad()
    
    func numberOfRows() -> Int
    
    func categoryFor(row: Int) -> String
    
}
