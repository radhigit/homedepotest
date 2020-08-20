//
//  OrderCollectionViewCell.swift
//  HomeDepotTest
//
//  Created by Radhika Ampajalam on 8/20/20.
//  Copyright © 2020 Radhika Ampajalam. All rights reserved.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "order"
    
    @IBOutlet weak var orderID: UILabel!
    @IBOutlet weak var total: UILabel!
    
    func configure(_ orderID: String, total: Float) {
        self.orderID.text =  orderID
        self.total.text = String(format:"%.2f", total)
    }
    
}
