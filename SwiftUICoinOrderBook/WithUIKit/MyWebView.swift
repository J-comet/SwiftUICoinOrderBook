//
//  MyWebView.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/27.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
}
