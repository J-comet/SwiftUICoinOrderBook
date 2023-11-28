//
//  OrderBookModel.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/28.
//

import Foundation


struct OrderBookModel: Decodable {
    let market: String
    let timestamp: Int
    let totalAskSize, totalBidSize: Double
    let orderbookUnits: [OrderBookUnit]

    enum CodingKeys: String, CodingKey {
        case market, timestamp
        case totalAskSize = "total_ask_size"
        case totalBidSize = "total_bid_size"
        case orderbookUnits = "orderbook_units"
    }
}

struct OrderBookUnit: Decodable {
    let askPrice, bidPrice: Double
    let askSize, bidSize: Double

    enum CodingKeys: String, CodingKey {
        case askPrice = "ask_price"
        case bidPrice = "bid_price"
        case askSize = "ask_size"
        case bidSize = "bid_size"
    }
}


// View 에서 가공해서 사용하려고 하는 모델
struct OrderBookItem: Hashable, Identifiable {
    let id = UUID()
    let price: Double
    let size: Double
}
