//
//  EntryView.swift
//  WigetOrderBookExtension
//
//  Created by 장혜성 on 2023/11/30.
//

import SwiftUI

// 위젯을 구성하는 View
// 위젯은 List 제약이 있음
struct WidgetOrderBookEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.test)
            Text(entry.date, style: .time)
            Text(UserDefaults.groupShared.string(forKey: "Market") ?? "호잇호잇")
//            Text(entry.token)
            Text(entry.price.formatted())
        }
    }
}

//#Preview {
//    EntryView()
//}
