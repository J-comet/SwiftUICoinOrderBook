//
//  HorizontalViewModel.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/27.
//

import Foundation

class HorizontalViewModel: ObservableObject {
    
    @Published var value = 0.0
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.value += 0.5
        }
    }
}
