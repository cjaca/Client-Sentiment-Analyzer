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
    let model = StarCalculator()
    let user = User(avatar: "👨🏻‍💻", nickname: "@cjaca", fullName: "Jacek Ciuba")
    
    var body: some View {
        ZStack{
            
            StyleSheet.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(messages, id: \.id) {
                                MessageView(text: $0.text, star_rating: $0.rating, user: $0.user)
                                .scaleEffect(x: 1, y: -1, anchor: .center)
                        }
                    }.padding(.bottom, 5)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
                .scaleEffect(x: 1, y: -1, anchor: .center)
                
                Divider()
                
                HStack(alignment: .center) {
                    GrowingTextInputView(text: $text, star_rating: $star_rating, placeholder: "Message")
                        .cornerRadius(10)
                    Button(action: {
                        if self.text != nil {
                            let result = self.calculateStar(text: self.text!)
                            self.sendAction(star_rating: result)
                        }
                    }) {
                        Text("Send")
                    }
                }.padding()
                
            }
        }.onAppear(perform: {
            let _ = self.generateMessage()
        })
    }
    
    
    func generateMessage() {
        _ = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
            let characterNumber = Int.random(in: 0 ..< users.count)
            let messageNumber = Int.random(in: 0 ..< reviews.count)
            do {
                let prediction = try self.model.prediction(text: reviews[messageNumber])
                let newMessage = Message(text: reviews[messageNumber], rating: prediction.label, user: users[characterNumber])
                self.messages.insert(newMessage, at: 0)
            } catch{
                print(error)
            }
        }
    }
    
    func calculateStar(text: String) -> String{
        do {
            let prediction = try self.model.prediction(text: text)
            star_rating = prediction.label
            return star_rating!
        }catch {
            print(error)
        }
        return ""
    }
    
    func sendAction(star_rating: String){
        guard let text = text, !text.isEmpty else {return}
        let newMessage = Message(text: text, rating: star_rating, user: user)
        messages.insert(newMessage, at: 0)
        self.text = nil
        UIApplication.shared.windows.forEach{ $0.endEditing(true)}
    }
    
    func update(with date: Date?) -> String{
        return date.map(formatted) ?? " "
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
