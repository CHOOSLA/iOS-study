//
//  Vote.swift
//  Clazzi
//
//  Created by choosla on 8/27/25.
//

import Foundation
import FirebaseFirestore

// Identifiable : 고유의 객체임을 알려주는 것
// Codable : 구조체 모습으로 바로 변환을 해줌 json 형식에 맞게
// Json 데이터를 스위프트 모델로 자동 변환할 때 사용하는 프로토콜
struct Vote: Identifiable, Codable{
  // DocumentID : 파이어베이스의 도큐먼트의 항목을 id로 지정
  @DocumentID var id: String?
  var title: String
  var createdBy: String
  var createdAt: Date
  var options: [VoteOption]
  var imageURL: String?
  
  init(title: String, createdBy: String, options: [VoteOption] = [], imageURL: String? = nil){
    self.id = nil
    self.title = title
    self.options = options
    self.createdBy = createdBy
    self.createdAt = Date()
    self.imageURL = imageURL
  }
}

struct VoteOption: Identifiable, Codable{
  @DocumentID var id: String?
  var name: String
  var voters: [String] = [] // 여기에 투표자 ID 저장
  
  init(name: String, voters: [String] = []){
    self.id = nil
    self.name = name
    self.voters = voters  }
}
