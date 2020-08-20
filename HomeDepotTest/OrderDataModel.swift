//
//  OrderModel.swift
//  HomeDepotTest
//
//  Created by Radhika Ampajalam on 8/20/20.
//  Copyright © 2020 Radhika Ampajalam. All rights reserved.
//

import Foundation

struct Order: Codable {
    let orderId: String?
    let orderDate: String?
    let status: String?
    let orderTotal: Float?
    let brand: String?
    let type: String?
    let storeNumber: String?
    let registerNumber: String?
    let transactionNumber: String?
    let date: String?
    let total: String?
}

enum CodingKeys: String, CodingKey {
    case orderId,orderDate,status,orderTotal,brand,type,storeNumber,registerNumber,transactionNumber,date,total
}

extension Order {
    var formattedOrderDate: String {
        return orderDate ?? date ?? "23982938"
    }
    var formattedReceiptId: String? {
        guard let storeNumber = storeNumber, let registerNumber = registerNumber, let transactionNumber = transactionNumber else { return orderId }
        return  storeNumber + registerNumber + transactionNumber
    }
}

