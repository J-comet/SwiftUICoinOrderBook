//
//  WalletModel.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/22.
//

import Foundation
import SwiftUI

struct WalletModel: Hashable {
    let color = Color.random()
    let name: String
    let index: Int
}

var wallet = [
    WalletModel(name: "Hue Card", index: 0),
    WalletModel(name: "Jack Card", index: 1),
    WalletModel(name: "Bran Card", index: 2),
    WalletModel(name: "Koko Card", index: 3)
]
