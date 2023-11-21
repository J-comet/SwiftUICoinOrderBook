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
    @Published var markets: [Market] = []
    
    func fetchBanner() {
        banner = Banner()
    }
    
    func fetchAllMarket() {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("데이터 없음")
                return
            }
            
            // do try catch 를 사용했을 때 에러를 확인할 수 있음.
            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.markets = decodedData
//                    completionHandler(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
