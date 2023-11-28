//
//  HorizontalViewModel.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/27.
//

import Foundation

// ObservableObject: 관찰자 역할
class HorizontalViewModel: ObservableObject {
    
    @Published var value = 0.0    
    @Published var dummy: [HorizontalData] = []
    
    @Published var askOrdersBook: [OrderBookItem] = []
    @Published var bidOrderBook: [OrderBookItem] = []
    
    let market: Market
    
    init(market: Market) {
        self.market = market
    }

    func fetctDummyData() {
        dummy = [
            HorizontalData(data: "호랑이"),
            HorizontalData(data: "사자"),
            HorizontalData(data: "펭귄"),
            HorizontalData(data: "곰"),
            HorizontalData(data: "낙타"),
            HorizontalData(data: "백호"),
            HorizontalData(data: "거북이"),
            HorizontalData(data: "개구리")
        ]
    }
    
    func largest() -> Int {
        let data = dummy.sorted { $0.point > $1.point }
        return data.first!.point
    }
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            self.value += 5
            // DummyData 달라지도록 구성
            self.fetctDummyData()
            
//            self.fetchAllMarket()
        }
    }
    
    func largetAskSize() -> Double {
        return askOrdersBook.sorted(by: { $0.size > $1.size }).first!.size
    }
    
    func largetBidSize() -> Double {
        return bidOrderBook.sorted(by: { $0.size > $1.size }).first!.size
    }

    func fetchAllMarket() {
        let url = URL(string: "https://api.upbit.com/v1/orderbook?markets=\(market.market)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                print("데이터 없음")
                return
            }
            
            // do try catch 를 사용했을 때 에러를 확인할 수 있음.
            do {
                let decodedData = try JSONDecoder().decode([OrderBookModel].self, from: data)
                
                print(decodedData)
                
                DispatchQueue.main.async { [weak self] in
                    let result = decodedData.first?.orderbookUnits ?? [OrderBookUnit(askPrice: 0, bidPrice: 0, askSize: 0, bidSize: 0)]
                    
                    let ask = result.map { OrderBookItem(price: $0.askPrice, size: $0.askSize) }.sorted { $0.price > $1.price }
                    let bid = result.map { OrderBookItem(price: $0.bidPrice, size: $0.bidSize) }.sorted { $0.price > $1.price }
                    
                    self?.askOrdersBook = ask
                    self?.bidOrderBook = bid
                    
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
