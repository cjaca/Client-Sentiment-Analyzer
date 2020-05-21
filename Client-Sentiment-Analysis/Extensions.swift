//
//  Extensions.swift
//  Client-Sentiment-Analysis
//
//  Created by Jacek on 21/05/2020.
//  Copyright © 2020 Jacek. All rights reserved.
//

extension Optional where Wrapped == String {
  var orEmpty: String {
    self ?? ""
  }
}
