//
//  WalletView.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/22.
//

import SwiftUI

struct WalletView: View {
    
    @State private var isExpandable = false
    
    @State private var showDetail = false
    
    // 변경할 필요 없는데이터라 @State 키워드 제거
    private let walletItems = wallet
    
    @State private var currentWallet = WalletModel(name: "", index: 0)
    
    @Namespace var animation
    
    var body: some View {
        VStack {
            topTitle()
            cardSpace()
            Button("Animation ON") {
                withAnimation(.bouncy.delay(0.3)) {
                    isExpandable = true
                }
            }
            Button("Animation OFF") {
                withAnimation(.bouncy) {
                    isExpandable = false
                }
            }
        }
        .overlay {
            if showDetail {
                WalletDetailView(
                    showDetail: $showDetail,
                    currentWallet: currentWallet,
                    animation: animation
                )
            }
        }
        
    }
    
    func cardSpace() -> some View {
        ScrollView {
            ForEach(walletItems, id: \.self) { item in
                cardView(item)
            }
        }
        .overlay {
            // opacity 최소 0.01 되어야 유저 터치액션 상호작용 가능
            Rectangle()
                .fill(.white.opacity(isExpandable ? 0 : 0.01))
                .onTapGesture {
                    withAnimation {
                        isExpandable = true
                    }
                }
        }
    }
    
    func cardView(_ item: WalletModel) -> some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(item.color)
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .offset(y: CGFloat(item.index) * (isExpandable ? 0 : -100))
            .onTapGesture {
                withAnimation {
                    currentWallet = item
                    showDetail = true
                }
            }
            .matchedGeometryEffect(id: item, in: animation)
    }
    
    func topTitle() -> some View {
        Text("HS Wallet")
            .font(.largeTitle)
            .bold()
            .frame(
                maxWidth: .infinity,
                alignment: isExpandable ? .leading : .center)
            .overlay(alignment: .trailing) {
                topOverlayButton()
            }
            .padding()
    }
    
    func topOverlayButton() -> some View {
        Button {
            withAnimation(.bouncy) {
                isExpandable.toggle()
            }
        } label: {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .padding(16)
                .background(.black, in: Circle())
        }
        .rotationEffect(.degrees(isExpandable ? 225 : 45))
        .opacity(isExpandable ? 1 : 0)
    }
}



#Preview {
    WalletView()
}
