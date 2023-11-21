//
//  UpbitAPI.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/21.
//

import Foundation

struct UpbitAPI {
    private init() { }
    
    static func fetchAllMarket(completionHandler: @escaping ([Market]) -> Void) {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("데이터 없음")
                return
            }
            
            // do try catch 를 사용했을 때 에러를 확인할 수 있음. 
            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)
                DispatchQueue.main.async {
                    completionHandler(decodedData)
                }
            } catch {
                print(error)
            }            
        }.resume()
    }
}
