//
//  OrdersServiceProtocol.swift
//  HomeDepotTest
//
//  Created by Radhika Ampajalam on 8/20/20.
//  Copyright © 2020 Radhika Ampajalam. All rights reserved.
//

import Foundation

protocol OrdersServiceProtocol {
    func fetchOrders() -> [Order]?
}
struct OrdersService: OrdersServiceProtocol {
    func fetchOrders() -> [Order]? {
        do {
             let url = Bundle.main.url(forResource: "orders", withExtension: "json")!
             let data = try Data(contentsOf: url)
             let res = try JSONDecoder().decode(OrderDetails.self, from: data)
            return res.orders
        
        }
        catch {
            print(error)
        }
        return nil
    }
}
