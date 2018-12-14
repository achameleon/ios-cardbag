//
//  TableViewCell.swift
//  cardbag
//
//  Created by Admin on 15.11.2018.
//  Copyright © 2018 E-Lite-Telecom. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var ClassCard: UILabel!
    @IBOutlet weak var Discount: UILabel!
    @IBOutlet weak var Front: UIImageView!
    @IBOutlet weak var Back: UIImageView!
    @IBOutlet weak var Button: UIButton!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    
    
    func setDatas( Name:String, ClassCard:String, Discount:String, Front:UIImage? , Back:UIImage? ){
        self.Name.text = Name
        self.ClassCard.text = ClassCard
        self.Discount.text = Discount
        
    }
    
   
    
}

