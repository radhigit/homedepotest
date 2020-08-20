//
//  OrderListDataSource.swift
//  HomeDepotTest
//
//  Created by Radhika Ampajalam on 8/20/20.
//  Copyright © 2020 Radhika Ampajalam. All rights reserved.
//
import UIKit
import Foundation


final class OrderListDataSource: NSObject {
    private let orders: [Order]?
    var sections = [GroupedSection<Date, Order>]()
    
    
    init(orders: [Order]?) {
        self.orders = orders
        if  let orders = orders {
            self.sections = GroupedSection.group(rows: orders, by: { ($0.commonDate ?? Date()) })
            self.sections.sort { lhs, rhs in lhs.sectionItem < rhs.sectionItem }
        }
    }
}

extension OrderListDataSource: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = self.sections[section]
        return section.rows.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderCollectionViewCell.cellID,
                                                            for: indexPath)
            as?  OrderCollectionViewCell else { fatalError() }
        
        let section = self.sections[indexPath.section]
        let order = section.rows[indexPath.row]
        var formattedOrderId = order.orderId
        if order.isInStorePurchase, let storeNum = order.storeNumber, let registerNumber = order.registerNumber, let transactionNumber = order.transactionNumber {
            formattedOrderId = storeNum + "-" + registerNumber + "-" + transactionNumber
        }
        cell.configure(order.orderId ?? formattedOrderId ?? "", total:  order.orderTotal ?? order.total ?? 0.0)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            guard let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: OrderHeaderCell.cellID, for: indexPath as IndexPath) as? OrderHeaderCell else { fatalError() }
            
            let section = self.sections[indexPath.section]
            let date = section.sectionItem
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM dd, yyyy"
            
            headerCell.backgroundColor = UIColor.gray;
            headerCell.setTitle(title: dateFormatter.string(from: date))
            return headerCell
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        O section: Int) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 40)
    }
}


