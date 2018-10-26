//
//  CustomCell.swift
//  Test
//
//  Created by Anton Skorodumov on 26/10/2018.
//  Copyright © 2018 chameleon production. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    
    func setup(title: String,
               image: UIImage) {
        lblTitle.text = title
        ivImage.image = image
    }
    
}
