//
//  TextViewWrapper.swift
//  Client-Sentiment-Analysis
//
//  Created by Jacek on 21/05/2020.
//  Copyright © 2020 Jacek. All rights reserved.
//

import SwiftUI

struct TextViewWrapper: UIViewRepresentable {
    
    @Binding var text: String?
    @Binding var star_rating: String?
    @Binding var focused: Bool
    @Binding var contentHeight: CGFloat
    
    init(text: Binding<String?>, star_rating: Binding<String?>, focused: Binding<Bool>, contentHeight: Binding<CGFloat>){
        self._text = text
        self._star_rating = star_rating
        self._focused = focused
        self._contentHeight = contentHeight
    }
    
    // MARK: -UIViewRepresentable
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = .systemFont(ofSize: 16)
        textView.backgroundColor = .clear
        textView.autocorrectionType = .no
        return textView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text, focused: $focused, contentHeight: $contentHeight)
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        @Binding private var text: String?
        @Binding private var focused: Bool
        @Binding private var contentHeight: CGFloat
        
        init(text: Binding<String?>, focused: Binding<Bool>, contentHeight: Binding<CGFloat>){
            self._text = text
            self._focused = focused
            self._contentHeight = contentHeight
        }
        
        // MARK: - UITextViewDelegate
        
        func textViewDidChange(_ textView: UITextView) {
            text = textView.text
            contentHeight = textView.contentSize.height
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            focused = true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            focused = false
            contentHeight = text == nil ? 0 : textView.contentSize.height
        }
        
        
    }
}


#if DEBUG
struct TextViewWrapper_Previews: PreviewProvider {
    @State static var text: String?
    @State static var star_rating: String?
    
    static var previews: some View {
        TextViewWrapper(text: $text, star_rating: $star_rating, focused: .constant(false), contentHeight: .constant(0))
    }
}
#endif
