//
//  User.swift
//  Clazzi
//
//  Created by choosla on 8/28/25.
//

import Foundation
import SwiftData

@Model
final class User{
  // Attribute(.unique) 속성이 유일값을 보장
  @Attribute(.unique) var id: UUID
  
  var email:String
  var password: String
  
  init(email: String, password: String) {
    self.email = email
    self.password = password
    self.id = UUID()
  }
}
