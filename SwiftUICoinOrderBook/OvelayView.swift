//
//  OvelayView.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/21.
//

import SwiftUI

struct OvelayView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.yellow)
                .frame(width: 150, height: 150)
                
                // ZStack 의 사이즈와 별도로 동작하기 때문에
                // Circle 뷰 영역과 상관없이 동작
                Text("요요요욥 긴 텍스트으으으으으으으으으으으으으으")
            }
            
            // overlay 를 사용하면 Cicle 뷰 안의 영역에서 동작
            Circle()
                .fill(.yellow)
                .frame(width: 150, height: 150)
                .overlay {
                    Text("요요용 긴 텍스트으으으으으으으으으으으으으")
                }
        }
        
    }
}

#Preview {
    OvelayView()
}
