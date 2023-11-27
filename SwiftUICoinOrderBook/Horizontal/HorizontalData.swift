//
//  HorizontalData.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/27.
//

import Foundation

struct HorizontalData: Identifiable {
    let id = UUID()
    let data: String
    let point = Int.random(in: 10...3000)
}

let horizontalDummy = [
    HorizontalData(data: "호랑이"),
    HorizontalData(data: "사자"),
    HorizontalData(data: "펭귄"),
    HorizontalData(data: "곰"),
    HorizontalData(data: "낙타"),
    HorizontalData(data: "백호"),
    HorizontalData(data: "거북이"),
    HorizontalData(data: "개구리")
]

func largest() -> Int {
    let data = horizontalDummy.sorted { $0.point > $1.point }
    return data.first!.point
}
