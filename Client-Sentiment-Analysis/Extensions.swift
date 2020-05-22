//
//  Extensions.swift
//  Client-Sentiment-Analysis
//
//  Created by Jacek on 21/05/2020.
//  Copyright © 2020 Jacek. All rights reserved.
//

import SwiftUI

struct StyleSheet {
        static let backgroundColor: Color = Color(hex: 0x121b2e)
        static let tintColor: Color = Color(hex: 0x414857)
        static let nickname: Color = Color(hex: 0xb1b4bb)
}

extension Optional where Wrapped == String {
  var orEmpty: String {
    self ?? ""
  }
}

extension Color {
  init(hex: Int, alpha: Double = 1) {
      let components = (
          R: Double((hex >> 16) & 0xff) / 255,
          G: Double((hex >> 08) & 0xff) / 255,
          B: Double((hex >> 00) & 0xff) / 255
      )
      self.init(
          .sRGB,
          red: components.R,
          green: components.G,
          blue: components.B,
          opacity: alpha
      )
    }
}

func update(with date: Date?) -> String{
    return date.map(formatted) ?? " "
}

func formatted(date: Date) -> String {
    let timeInterval = -date.timeIntervalSinceNow
    switch timeInterval {
    case ..<60:
        return "\(Int(timeInterval))s"
    case ..<3600:
        return "\(Int(timeInterval/60))min"
    case ..<86400:
        return "\(Int(timeInterval/3600))h"
    default:
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY.MM.d HH:mm"
        return dateFormatter.string(from: date)
    }
}


