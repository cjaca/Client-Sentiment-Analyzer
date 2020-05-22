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
        
    
    init(text: String?, star_rating: String?, user: User?){
        self.text = text!
        self.star_rating = star_rating!
        self.user = user!
        self.timeControl = timerController()
        self.timeControl.date = Date()
        self.timeControl.startCount()
    }
    var text: String
    var star_rating: String
    var user: User
    @ObservedObject var timeControl: timerController
    
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
                            Text(user.nickname+" · "+(timeControl.dateLabel ?? " "))
                                .font(.system(.subheadline))
                                .foregroundColor(StyleSheet.nickname)
                        }
                        Text(text)
                            .font(.system(.subheadline))
                    }.padding(.trailing, 20)
                    .foregroundColor(.white)
                }
    }
}

class timerController: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    var dateLabel = ""

    private var timer: Timer?
    
    var date = Date() { didSet { dateLabel = update(with: date) } }
    
    func startCount(){
        var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.dateLabel = update(with: self.date)
            self.objectWillChange.send()
            print(self.dateLabel)
        }
    }
}


struct MessageView_Previews: PreviewProvider {
    @State static var dateLabel: String?
    
    static var previews: some View {
        MessageView(text: "", star_rating: "", user: User(avatar: "", nickname: "", fullName: ""))
    }
}
