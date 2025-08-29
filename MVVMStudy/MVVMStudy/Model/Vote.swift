//
//  Vote.swift
//  MVVMStudy
//
//  Created by choosla on 8/29/25.
//

import Foundation

struct Vote: Identifiable{
  let id : UUID
  var title: String
  var options: [[String: Int]] // 옵션과 투표수
  
  init(id: UUID = UUID(), title: String, options: [[String:Int]]){
    self.id = id
    self.title = title
    self.options = Dictionary(uniqueKeysWithValues: options.map{($0, 0)})
  }
}
