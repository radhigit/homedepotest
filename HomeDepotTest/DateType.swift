//
//  DateType.swift
//  HomeDepotTest
//
//  Created by Radhika Ampajalam on 8/20/20.
//  Copyright © 2020 Radhika Ampajalam. All rights reserved.
//

import Foundation

enum DateType {

    case orderDate
    case formattedFinaldate
    case date
    
    var formatter: DateFormatter {

        let formatter = DateFormatter()

        let format: String
        switch self {
        case .orderDate:
            format = "yyyy-MM-dd'T'HH:mm:ssZ"
        case .formattedFinaldate:
            format = "MM dd, yyyy "
        case .date:
            format = "yyyy-MM-dd"
           }
        
        formatter.dateFormat = format
        return formatter
    }
}

extension Date {
    func stringWith(dateType: DateType) -> String {
        return dateType.formatter.string(from: self)
    }
}

