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
  @State var currentUser : FirebaseAuth.User? = nil
  
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
        }else if currentUser != nil {
          VoteListView(currentUser : $currentUser)
        } else {
          AuthView(currentUser : $currentUser)
        }
      }
      .onAppear{
        Task {
          try await Task.sleep(nanoseconds: 2_000_000_000) // 2초
          currentUser = Auth.auth().currentUser
          isLoading = false
        }
      }
      
    }
  }
}
