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
    
    let user = User(avatar: "👨🏻‍💻", nickname: "@cjaca", fullName: "Jacek Ciuba")
    
    var body: some View {
        ZStack{
            
            StyleSheet.backgroundColor
                .edgesIgnoringSafeArea(.all)
              VStack(spacing: 0) {
                ScrollView {
                  VStack(alignment: .leading, spacing: 16) {
                    ForEach(messages, id: \.id) {
                        self.message_view(text: $0.text, star_rating: $0.rating, user: $0.user)
                        .scaleEffect(x: 1, y: -1, anchor: .center)
                            .transition(.opacity)
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
        }
    }
    
    
    func calculateStar(text: String) -> String{
        let model = StarCalculator()
        do {
            let prediction = try model.prediction(text: text)
            star_rating = prediction.label
            return star_rating!
        }catch {
            // something went wrong
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
    
    
    func stars(text: String) -> some View{
        let numberOfStars = Int(text)
        let star = Image(systemName: "star")
        let star_fill = Image(systemName: "star.fill")
        return HStack{
            ForEach(0 ..< 5-numberOfStars!){_ in
                star
            }
            ForEach(0 ..< numberOfStars!){_ in
                star_fill
            }
        }
    }
    
    func update(with date: Date?) -> String{
        return date.map(formatted) ?? " "
    }

    func message_view(text: String, star_rating: String, user: User) -> some View {
//        var date = Date() { didSet { dateLabel = update(with: date) } }
//        var dateLabel : String?
//        var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            dateLabel = self.update(with: date)
//            print(dateLabel)
//        }
//        return HStack(alignment: .top){
//            VStack(alignment: .center){
//                Stars(numberOfStars: Int(star_rating)!, avatar: user.avatar)
//            }.padding(.leading, 10)
//                .padding(.top, 10)
//
//            VStack(alignment:.leading){
//                HStack{
//                    Text(user.fullName)
//                        .font(.system(.headline))
//                        .padding(.vertical, 12)
//                    Text(user.nickname+" · "+dateLabel!)
//                        .font(.system(.subheadline))
//                        .foregroundColor(StyleSheet.nickname)
//                }
//                Text(text)
//                    .font(.system(.subheadline))
//            }.padding(.trailing, 20)
//            .foregroundColor(.white)
//        }
        return MessageView(text: text, star_rating: star_rating, user: user)
    }
}


extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.leading]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}




#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
