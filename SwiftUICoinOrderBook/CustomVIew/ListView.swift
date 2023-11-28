//
//  ListView.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/21.
//

import SwiftUI

struct ListView: View {
    // ObservedObject vs StateObject
    /**
     ObservedObject
     - 기존 데이터 초기화
     - init 이 되고 기존 데이터 유실
     
     StateObject
     - 기존 데이터. 유지
     - init 은 다시 되어도 기존 데이터는 유지
     ObservedObject =.
     */
    
//    @ObservedObject var viewModel = ListViewModel()  - 사용이필요하다면 api 과호출할 수 있어서 조심.
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        
        LazyVStack {
            Button("API 호출 버튼") {
                viewModel.fetchAllMarket()
            }
            ForEach(viewModel.markets, id: \.self) { item in
                NavigationLink(value: item) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.korean)
                                .fontWeight(.bold)
                            Text(item.english)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        Text(item.market)
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            print("ListView onAppear")
//            viewModel.fetchAllMarket()
        }
        .navigationDestination(for: Market.self) { item in
            HorizontalView(viewModel: HorizontalViewModel(market: item))
        }
    }
}

//#Preview {
//    ListView()
//}
