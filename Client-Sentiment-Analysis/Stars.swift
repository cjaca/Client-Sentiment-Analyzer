//
//  Stars.swift
//  Client-Sentiment-Analysis
//
//  Created by Jacek on 21/05/2020.
//  Copyright © 2020 Jacek. All rights reserved.
//

import SwiftUI

struct Stars: View {
    
    var numberOfStars : Int = 1
    let star = Image(systemName: "star")
    let star_fill = Image(systemName: "star.fill")
    var avatar: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack{
                RoundedRectangle(cornerRadius: 13)
                    .foregroundColor(StyleSheet.tintColor)
                Text(avatar).font(.system(size: 45))
            }.frame(width: 50, height: 50, alignment: .center)
            
            ZStack{
                starz(number: numberOfStars)
                star_fill.position(x: 10, y: 5).font(.system(size: 12)).foregroundColor(.yellow)
                star.position(x: 25, y: 5).font(.system(size: 12)).foregroundColor(.yellow)
                star.position(x: 40, y: 5).font(.system(size: 12)).foregroundColor(.yellow)
                star.position(x: 17, y: 20).font(.system(size: 12)).foregroundColor(.yellow)
                star.position(x: 32, y: 20).font(.system(size: 12)).foregroundColor(.yellow)
            }.frame(width: 50, height: 50, alignment: .center)
        }
    }
    
    func starz(number: Int) -> some View {
        let numberOfStars = number
        let star_fill = self.star_fill.font(.system(size: 12)).foregroundColor(.yellow)
        return ZStack{
            if (numberOfStars == 1){
                star_fill.position(x: 10, y: 5)
            }else if (numberOfStars == 2) {
                star_fill.position(x: 10, y: 5)
                star_fill.position(x: 25, y: 5)
            }else if (numberOfStars == 3){
                star_fill.position(x: 10, y: 5)
                star_fill.position(x: 25, y: 5)
                star_fill.position(x: 40, y: 5)
            }else if (numberOfStars == 4) {
                star_fill.position(x: 10, y: 5)
                star_fill.position(x: 25, y: 5)
                star_fill.position(x: 40, y: 5)
                star_fill.position(x: 17, y: 20)
            }else{
                star_fill.position(x: 10, y: 5)
                star_fill.position(x: 25, y: 5)
                star_fill.position(x: 40, y: 5)
                star_fill.position(x: 17, y: 20)
                star_fill.position(x: 32, y: 20)
            }
        }
    }
}

struct Stars_Previews: PreviewProvider {
    static var previews: some View {
        Stars()
    }
}
