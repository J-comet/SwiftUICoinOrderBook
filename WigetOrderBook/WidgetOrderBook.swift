//
//  WidgetOrderBook.swift
//  WigetOrderBook
//
//  Created by 장혜성 on 2023/11/29.
//

import WidgetKit
import SwiftUI

/**
 위젯과 앱의 데이터를 공유
 - App Group 을 활용해야함, (유료계정 필요)
 - Target - App - Signing & Configure - App Group 추가
 - 위젯과 앱은 완전히 다른 앱
 
    * iOS16 - 위젯 크기 중 가장 작은 상태일 때는 특정 버튼으로 또 다른 액션을 줄 수 없음. 오직 하나의 기능만 가능 ex) 특정 화면으로 이동, 앱 켜기
    * iOS17 - 위젯 크기와 상관없이 특정버튼으로 액션 넣는 것 가능
 
 위젯 Small = WidgetURL
 위젯 Medium / Large = Link
 */

struct WigetOrderBook: Widget {
    let kind: String = "WigetOrderBook" // 위젯 구분하기위한 고유한 문자열

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WidgetOrderBookEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                WidgetOrderBookEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("보유 코인")
        .description("실시간 시세를 확인하세요")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

//#Preview(as: .systemSmall) {
//    WigetOrderBook()
//} timeline: {
//    SimpleEntry(date: .now, emoji: "😀")
//    SimpleEntry(date: .now, emoji: "🤩")
//}
