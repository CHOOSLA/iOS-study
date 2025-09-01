//
//  ClazziFirebaseApp.swift
//  ClazziFirebase
//
//  Created by choosla on 9/1/25.
//

import SwiftUI
import SwiftData

@main
struct ClazziFirebaseApp: App {
  // 로그인 상태
  @State var isLoggedIn: Bool = false
  
  // 로그인 상태
  //    @State var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn")
  @State var currentUserId: UUID? = {
    if let idString = UserDefaults.standard.string(forKey: "currentUserID"), let id = UUID(uuidString: idString){
      return id
    }
    
    return nil
  }()
  
  // 스위프트 데이터 컨테이너
  var shaerdModelConatiner: ModelContainer = {
    let schema = Schema([
      Vote.self,
      VoteOption.self,
      User.self
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    do{
      return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
      fatalError("모델 컨테이너를 생성하지 못했습니다. \(error)")
    }
  }()
  var body: some Scene {
    WindowGroup {
      if currentUserId != nil {
        VoteListView(currentUserId : $currentUserId)
      } else {
        AuthView(currentUserId : $currentUserId)
      }
    }
    .modelContainer(shaerdModelConatiner)
  }
}
