//
//  BannerTestView.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/21.
//

import SwiftUI

struct BannerTestView: View {
    
    @Binding var testNumber: Int
    
    var body: some View {
        VStack {
            Text("테스트 \(testNumber)")
            Button("액션") {
                testNumber = Int.random(in: 0...100)
            }
        }
        
    }
}

#Preview {
    BannerTestView(testNumber: .constant(5))
}
