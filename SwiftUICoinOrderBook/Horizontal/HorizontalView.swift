//
//  HorizontalView.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/27.
//

import SwiftUI

struct HorizontalView: View {
    
    @StateObject var viewModel = HorizontalViewModel(market: Market(market: "krw=btc", korean: "비트코인", english: "Bitcoin"))
    
    var body: some View {
        ScrollView {
            
            Text(viewModel.market.korean)
            // 디바이스 기준으로 계산
            GeometryReader { proxy in
                
                let grapWidth = proxy.size.width * 0.7
                VStack {
                    ForEach(viewModel.askOrdersBook, id:\.id) { item in
                        HStack {
                            Text(item.price.formatted())
                                .frame(maxWidth: proxy.size.width * 0.25)
                            ZStack(alignment: .leading) {
                                
                                let graphSize = item.size / viewModel.largetAskSize() * grapWidth
                                
                                Rectangle()
                                    .foregroundStyle(Color.blue.opacity(0.3))
                                    .frame(maxWidth: graphSize, alignment: .leading)
                                                                
                                Text(item.size.formatted())
                                    .frame(width: grapWidth)
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                        }
                        .frame(height: 40)
                    }
                }
                .background(Color.green)
            }
            
        }
        .onAppear {
            viewModel.timer()
            viewModel.fetchAllMarket()
        }
    }
}

//#Preview {
//    HorizontalView()
//}
