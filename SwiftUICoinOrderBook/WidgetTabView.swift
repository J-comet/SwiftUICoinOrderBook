//
//  WidgetTabView.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/30.
//

import SwiftUI

struct WidgetTabView: View {
    
    @State private var selectedTab = "book"
    
    var body: some View {
        // 해당 탭 태그 설정후 태그로 어떤 탭인지 구분
        TabView(selection: $selectedTab) {
            Button("1111") {
                selectedTab = "favorite"
            }.tabItem { Image(systemName: "book") }
                .tag("book")
            Text("favorite 화면")
                .tabItem { Image(systemName: "heart") }
                .tag("favorite")
            Text("pencil 화면")
                .tabItem { Image(systemName: "pencil") }
                .tag("pencil")
        }
        .onOpenURL(perform: { url in
            switch url.absoluteString {
            case "History": selectedTab = "book"
            case "Favorite": selectedTab = "favorite"
            default: selectedTab = "pencil"
            }
        })
    }
}

#Preview {
    WidgetTabView()
}
