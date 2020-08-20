//
//  ViewController.swift
//  HomeDepotTest
//
//  Created by Radhika Ampajalam on 8/20/20.
//  Copyright © 2020 Radhika Ampajalam. All rights reserved.
//
import UIKit
import Foundation

final class OrderViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var ordersCollectionView: UICollectionView!
    
    // MARK: - Members
    
    lazy var viewModel: OrderViewModel = {
        OrderViewModel(delegate: self, allOrdersFetcher: OrdersService())
    }()
    
    private var orderDataSource: OrderListDataSource?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Orders"        
        setupCollectionView()
        ordersCollectionView.register(UINib(nibName: "OrderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: OrderCollectionViewCell.cellID)
        viewModel.viewDidLoad()
    }
}

// MARK: - Collection view setup

private extension OrderViewController {
    func setupCollectionView() {
        ordersCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension OrderViewController: OrderViewModelDelegate {
    func onOrdersLoaded(_ orders: [Order]) {
        updateDataSource(from: orders)
    }
    func onShowError(_ message: String) {
        print("error")
    }
    
}

private extension OrderViewController {
    func updateDataSource(from orders: [Order]) {
        orderDataSource = OrderListDataSource(orders: orders)
        ordersCollectionView.dataSource = orderDataSource
        ordersCollectionView.delegate = orderDataSource
        ordersCollectionView.reloadData()
    }
}
