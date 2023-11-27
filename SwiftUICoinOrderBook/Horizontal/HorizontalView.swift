//
//  HorizontalView.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/27.
//

import SwiftUI

struct HorizontalView: View {
    
    @StateObject var viewModel = HorizontalViewModel()
    
    var body: some View {
        ScrollView {
            
            Text("\(viewModel.value)")
            // 디바이스 기준으로 계산
            GeometryReader { proxy in
                
                let grapWidth = proxy.size.width
                
                VStack {
                    ForEach(horizontalDummy, id:\.id) { item in
                        HStack {
                            Text(item.data)
                                .frame(maxWidth: proxy.size.width * 0.2)
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundStyle(Color.blue.opacity(0.4))
                                    .frame(width: CGFloat(item.point) / 10)
                                    .frame(maxWidth: grapWidth * 0.7)
                                
                                Text(item.point.formatted())
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                        }
                        .frame(height: 40)
                    }
                }
                .onTapGesture {
                    viewModel.timer()
                    print(proxy)
                    print(proxy.size)
                    print(largest())
                }
            }
            
        }
    }
}

