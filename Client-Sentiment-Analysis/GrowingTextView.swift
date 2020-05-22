//
//  SwiftUIView.swift
//  Client-Sentiment-Analysis
//
//  Created by Jacek on 21/05/2020.
//  Copyright © 2020 Jacek. All rights reserved.
//

import SwiftUI

struct GrowingTextInputView: View {
    
    @Binding var text: String?
    @Binding var star_rating: String?
    @State var focused: Bool = false
    @State var contentHeight: CGFloat = 0
    
    let placeholder: String?
    let minHeight: CGFloat = 30
    let maxHeight: CGFloat = 150
    
    init(text: Binding<String?>, star_rating: Binding<String?>, placeholder: String?){
        self._text = text
        self._star_rating = star_rating
        self.placeholder = placeholder
    }

    var countedHeight: CGFloat {
        min(max(minHeight, contentHeight), maxHeight)
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.white
            ZStack(alignment: .topLeading){
                placeholderView
                TextViewWrapper(text: $text, star_rating: $star_rating, focused: $focused, contentHeight: $contentHeight)
            }.padding(.horizontal, 4)
        }.frame(height: countedHeight)
    }
    
    var placeholderView: some View {
        ViewBuilder.buildIf(
            showPlaceholder ?
                placeholder.map {
                    Text($0)
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 4)
                } : nil
        )
    }
    
    var showPlaceholder : Bool {
        !focused && text.orEmpty.isEmpty == true
    }
    
}

#if DEBUG
struct GrowingTextInputView_Previews: PreviewProvider {
    @State static var text: String?
    @State static var star_rating: String?
    
    static var previews: some View {
        GrowingTextInputView(
            text: $text,
            star_rating: $star_rating,
            placeholder: "Placeholder"
        )
    }
}
#endif
