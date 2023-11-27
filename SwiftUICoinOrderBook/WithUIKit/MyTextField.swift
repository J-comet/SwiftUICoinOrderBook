//
//  MyTextField.swift
//  SwiftUICoinOrderBook
//
//  Created by 장혜성 on 2023/11/27.
//

import Foundation
import SwiftUI

// UIKit -> SwiftUI

struct MyTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField {
        let view = UITextField()
        view.borderStyle = .none
        view.keyboardType = .numberPad
        view.tintColor = .red
        view.font = .boldSystemFont(ofSize: 20)
        view.textAlignment = .center
        view.placeholder = "UIKit 텍스트필드입니다"
        view.text = text
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    // UIKit -> SwiftUI
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            text = textField.text ?? ""
            return true
        }
    }
    
}
