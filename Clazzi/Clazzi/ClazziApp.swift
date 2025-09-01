//
//  ClazziApp.swift
//  Clazzi
//
//  Created by choosla on 8/26/25.
//

import SwiftUI
import SwiftData

@main
struct ClazziApp: App {
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


#Preview{
  // 로그인 상태
  // @Previewable : 프리뷰 전용 속성 표시자
  // - 주로 @State, @ObservedObject, #environmentObject 앞에 붙여서 쓴다.
  @Previewable @State var currnetUserID: UUID? = {
    if let idString = UserDefaults.standard.string(forKey: "currnetUserId"),
        let id = UUID(uuidString: idString){
      return id
    }
    
    return nil
  }()
  
  // Group : 아무런 UI적 요소가 없는 뷰. 어떤 뷰를 묶어 공통으로 속성 주고 싶을 때 사욯나다. (vs. Box)
  Group{
    if currnetUserID == nil{
      AuthView(currentUserId: $currnetUserID)
    }else{
      VoteListView(currentUserId: $currnetUserID)
    }
  }
  .modelContainer(for: [User.self, Vote.self, VoteOption.self])
}
