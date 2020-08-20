//
//  OrderHeaderCell.swift
//  HomeDepotTest
//
//  Created by Radhika Ampajalam on 8/20/20.
//  Copyright © 2020 Radhika Ampajalam. All rights reserved.
//

import UIKit

class OrderHeaderCell: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static let cellID = "OrderHeader"

    func setTitle(title: String)  {
        self.titleLabel.text = title
        self.titleLabel.textColor = UIColor.black
    }
    
}
