//
//  OderViewModel.swift
//  HomeDepotTest
//
//  Created by Radhika Ampajalam on 8/20/20.
//  Copyright © 2020 Radhika Ampajalam. All rights reserved.
//

import Foundation

protocol OrderViewModelDelegate: class {
    func onOrdersLoaded(_: [Order])
}

final class OrderViewModel {
    private weak var delegate: OrderViewModelDelegate?
    private let allOrdersFetcher: OrdersServiceProtocol

    var orders: [Order]?
      
    init(delegate: OrderViewModelDelegate, allOrdersFetcher: OrdersServiceProtocol) {
        self.delegate = delegate
        self.allOrdersFetcher = allOrdersFetcher
    }

    func viewDidLoad() {
       getOrders()
        if let fetchedorders = orders {
            delegate?.onOrdersLoaded(fetchedorders)
        }
    }
    
    func getOrders() {
        self.orders =  allOrdersFetcher.fetchOrders()
    }
}

