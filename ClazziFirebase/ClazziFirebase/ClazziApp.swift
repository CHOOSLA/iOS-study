//
//  ClazziFirebaseApp.swift
//  ClazziFirebase
//
//  Created by choosla on 9/1/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct ClazziFirebaseApp: App {
  // 로그인 상태
  @StateObject var session = UserSession()
  
  // 인트로 화면 상태
  @State private var isLoading = true
  
  init(){
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      Group{
        if isLoading{
//          ProgressView("인트로 화면...")
          IntroView()
        }else if session.user == nil {
          AuthView()
        } else {
          VoteListView()
        }
      }
      .onAppear{
        Task {
//          try await Task.sleep(nanoseconds: 2_000_000_000) // 2초
          // 우리가 확장시킨 함수
          try await Task.sleep(seconds: 2)// 2초
          isLoading = false
        }
      }
      .environmentObject(session)
      
    }
  }
}
