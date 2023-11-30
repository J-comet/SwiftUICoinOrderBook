//
//  SimpleEntry.swift
//  WigetOrderBookExtension
//
//  Created by 장혜성 on 2023/11/30.
//

import WidgetKit

// 위젯을 구성하는데 필요한 데이터
struct SimpleEntry: TimelineEntry {
    // date: Date
    // 위젯이 언제 렌더링될지 사용되는 데이터
    // 사용하지 않더라도 프로퍼티로 가지고 있어야 됨
    let date: Date
    let test: String
    let token: String
    let price: Int
}
