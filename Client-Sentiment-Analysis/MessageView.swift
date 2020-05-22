//
//  MessageView.swift
//  Client-Sentiment-Analysis
//
//  Created by Jacek on 22/05/2020.
//  Copyright © 2020 Jacek. All rights reserved.
//

import SwiftUI
import Combine

struct MessageView: View {
        
    var text: String
    var star_rating: String
    var user: User
    var date = Date() { didSet { dateLabel = update(with: date) } }
    @State var dateLabel : String = "0s"

    
    init(text: String?, star_rating: String?, user: User?){
        self.text = text!
        self.star_rating = star_rating!
        self.user = user!
    }

    
    var body: some View {
        HStack(alignment: .top){
                    VStack(alignment: .center){
                        Stars(numberOfStars: Int(star_rating)!, avatar: user.avatar)
                    }.padding(.leading, 10)
                        .padding(.top, 10)
                    
                    VStack(alignment:.leading){
                        HStack{
                            Text(user.fullName)
                                .font(.system(.headline))
                                .padding(.vertical, 12)
                            Text(user.nickname+" · "+dateLabel)
                                .font(.system(.subheadline))
                                .foregroundColor(StyleSheet.nickname)
                        }
                        Text(text)
                            .font(.system(.subheadline))
                    }.padding(.trailing, 20)
                    .foregroundColor(.white)
        }.onAppear(perform: {
                    var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.dateLabel = update(with: self.date)
                    }
        })
    }
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(text: "", star_rating: "", user: User(avatar: "", nickname: "", fullName: ""))
    }
}
