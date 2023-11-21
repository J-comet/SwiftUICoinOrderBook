//
//  ContentViewModel.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/21.
//

import Foundation

// ObservableObject = 관찰자
final class ContentViewModel: ObservableObject {
    
    @Published var banner = Banner()
    
    func fetchBanner() {
        banner = Banner()
    }
    
    
}
