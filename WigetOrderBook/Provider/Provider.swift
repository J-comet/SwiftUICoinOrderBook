//
//  Provider.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/30.
//

import WidgetKit

struct Provider: TimelineProvider {
    
    typealias Entry = SimpleEntry
    
    // 위젯킷이 최초로 렌더링할 때 사용 > 스켈레톤 뷰로 렌더링
    func placeholder(in context: Context) -> Entry {
        SimpleEntry(date: Date(), test: "테스트", token: "abcdef", price: 0)
    }

    // 위젯 갤러리 미리보기 화면
    func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
        let entry = SimpleEntry(date: Date(), test: "미리보기", token: "ABCDEF", price: 1000)
        completion(entry)
    }

    // 위젯 상태 변경 시점
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, test: "상태변경", token: "토큰 완료", price: .random(in: 100...1000))
            entries.append(entry)
        }

        // 타임라인 마지막 날짜가 지난 뒤, 위젯킷이 새로운 타임라인을 요청할 수 있도록 설정
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
