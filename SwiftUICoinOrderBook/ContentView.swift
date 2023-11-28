//
//  ContentView.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var banner = "111,111,111원"
//    @State private var markets: [Market] = []
    
    // Published 데이터를 전달하면 ObservedObject 가 받음
    @ObservedObject var viewModel = ContentViewModel()
    
    @State var renderingTestNum = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("테스트: \(renderingTestNum)")
                NavigationLink("배너테스트", value: renderingTestNum)
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(1..<5) { data in
                                bannerView()
                                    .containerRelativeFrame(.horizontal) // 디바이스 width 만큼 꽉차게 설정
                                    .onTapGesture {
                                        viewModel.fetchBanner()
                                    }
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
                    ListView()
                    
                }
            }
            // 부모뷰의 속성을 자식뷰도 공유해서 내부 스크롤뷰 인디케이터도 숨김처리
            // 같은 모디파이어를 자식뷰도 설정해두었다면 자식스크롤뷰 기준으로 자식스크롤뷰는 설정 됨.
            .scrollIndicators(.hidden)
            .refreshable { // iOS15+
                // 당겨서 새로고침
                viewModel.fetchBanner()
                renderingTestNum = Int.random(in: 0...100)
            }
            .navigationTitle("My Wallet")
            .navigationDestination(for: Int.self) { item in
                BannerTestView(testNumber: .constant(item))
            }
            // 위 navigationDestination 코드와 동일하게 동작
//            .navigationDestination(for: Int.self) {
//                BannerTestView(testNumber: .constant($renderingTestNum))
//            }
            
        }
    }
    
    func bannerView() -> some View {
        ZStack {
            Rectangle()
                .fill(viewModel.banner.color)
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
                Text(viewModel.banner.totalFormat)
                    .font(.title)
                    .bold()
            }
            // 애니매이션 효과 설정
//            .visualEffect { content, geometryProxy in
//                content.offset(x: scrollOffset(geometryProxy))
//            }
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
    
}

#Preview {
    ContentView()
}
