//
//  Vote.swift
//  Clazzi
//
//  Created by choosla on 8/27/25.
//

import Foundation

struct Vote: Identifiable{
  var id = UUID()
  
  let title: String
  let options: [String]
}
