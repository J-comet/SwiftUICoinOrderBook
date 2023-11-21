//
//  ContentView.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var banner = "111,111,111원"
    
    @State private var markets: [Market] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(1..<5) { data in
                                bannerView()
                                    .containerRelativeFrame(.horizontal) // 디바이스 width 만큼 꽉차게 설정
                            }
                        }
                        // 1. 스크롤시 하나씩 넘기도록 설정
                        // 스크롤 하고자 하는 대상에 대한 레이아웃 설정
                        .scrollTargetLayout()
                    }
                    // 2. 스크롤시 하나씩 넘기도록 설정
                    .scrollTargetBehavior(.viewAligned)
                    // 좌우 영역 살짝 보이도록 설정하기
                    //                    .safeAreaPadding([.horizontal], 40)
                    
                    LazyVStack {
                        ForEach(markets, id: \.self) { data in
                            listView(data: data)
                        }
                    }
                }
            }
            // 부모뷰의 속성을 자식뷰도 공유해서 내부 스크롤뷰 인디케이터도 숨김처리
            // 같은 모디파이어를 자식뷰도 설정해두었다면 자식스크롤뷰 기준으로 자식스크롤뷰는 설정 됨.
            .scrollIndicators(.hidden)
            .refreshable { // iOS15+
                // 당겨서 새로고침
                banner = "999,999,999원"
//                markets = dummy.shuffled()
            }
            .onAppear {
                UpbitAPI.fetchAllMarket { data in
                    markets = data
                }
//                markets = dummy.shuffled()
            }
            .navigationTitle("My Wallet")
        }
    }
    
    func bannerView() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.gray)
                .overlay {
                    Circle()
                        .fill(.white.opacity(0.3))
                        .offset(x: -90, y: -20)
                        .scaleEffect(1.6, anchor: .topLeading)
                }
            // 어떤 모양대로 잘라낼지 설정
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                    .font(.title3)
                Text(banner)
                    .font(.title)
                    .bold()
            }
            // 애니매이션 효과 설정
            .visualEffect { content, geometryProxy in
                content.offset(x: scrollOffset(geometryProxy))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(8)
    }
    
    // GeometryProxy: 컨테이너 뷰에 대한 좌표나 크기에 접근할 수 있음
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let result = proxy.bounds(of: .scrollView)?.minX ?? 0
        return -result
    }
    
    func listView(data: Market) -> some View {
        HStack {
            VStack(alignment: .leading) {
//                Text(data.product)
//                Text(data.category.rawValue)
                Text(data.korean)
                Text(data.english)
            }
            Spacer()
            Text(data.market)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}

//#Preview {
//    ContentView()
//}
