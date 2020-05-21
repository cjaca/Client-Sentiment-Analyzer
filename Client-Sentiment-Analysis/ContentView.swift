//
//  ContentView.swift
//  Client-Sentiment-Analysis
//
//  Created by Jacek on 20/05/2020.
//  Copyright © 2020 Jacek. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text: String?
    @State private var star_rating: String?
    @State var messages: [Message] = []
    
    var body: some View {
        ZStack{
              Color.white
                .edgesIgnoringSafeArea(.all)
              VStack(spacing: 0) {
                HStack(alignment: .center) {
                  GrowingTextInputView(text: $text, star_rating: $star_rating, placeholder: "Message")
                    .cornerRadius(10)
                    Button(action: {
                        
                        var result = self.calculateStar(text: self.text!)
                        self.sendAction(star_rating: result)
                        
                    }) {
                    Text("Send")
                  }
                }.padding()
                Divider()
                ScrollView {
                  VStack(alignment: .trailing, spacing: 16) {
                    ForEach(messages, id: \.id) {
                        self.messageView(text: $0.text, star_rating: $0.rating)
                    }
                  }.padding(.top, 16)
                  .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                }.edgesIgnoringSafeArea(.bottom)
              }
        }
    }
    
    
    func calculateStar(text: String) -> String{
        let model = StarCalculator()
        do {
            let prediction = try model.prediction(text: text)
            star_rating = prediction.label
            print(star_rating)
            return star_rating!
        }catch {
            // something went wrong
        }
        return ""
    }

    func sendAction(star_rating: String){
        guard let text = text, !text.isEmpty else {return}
        let newMessage = Message(text: text, rating: star_rating)
        messages.insert(newMessage, at: 0)
        self.text = nil
        UIApplication.shared.windows.forEach{ $0.endEditing(true)}
    }
    
    func messageView(text: String, star_rating: String) -> some View {
        return VStack{
            HStack{
                Text(text)
                Text(star_rating)
            }
            .foregroundColor(.white)
            .padding(.all, 12)
            .background(Color.green)
            .cornerRadius(14)
            .padding(.trailing, 12)
            .padding(.leading, 32)
            
        }
    }


    struct Message {
        let id = UUID()
        let text: String
        let rating: String
    }
}




#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
