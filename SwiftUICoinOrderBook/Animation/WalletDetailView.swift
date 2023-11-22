//
//  WalletDetailView.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/22.
//

import SwiftUI

struct WalletDetailView: View {
    
    @Binding var showDetail: Bool
    
    let currentWallet: WalletModel  // WalletView 에서 선택한 카드 정보
    
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            Color.brown.ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(currentWallet.color)
                    .frame(height: 150)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .onTapGesture {
                        withAnimation {
                            showDetail = false
                        }
                    }
                    .matchedGeometryEffect(id: currentWallet, in: animation)
                Text(currentWallet.name)
                Spacer()
            }
        }
    }
}

//#Preview {
//    WalletDetailView(showDetail: .constant(false), currentWallet: WalletModel(name: "", index: 99))
//}
