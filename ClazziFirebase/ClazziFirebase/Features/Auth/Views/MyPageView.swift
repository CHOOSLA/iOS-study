//
//  MyPageView.swift
//  Clazzi
//
//  Created by choosla on 8/28/25.
//

import SwiftUI
import SwiftData
import FirebaseAuth

struct MyPageView: View {
  @EnvironmentObject var session: UserSession
  
  var body: some View {
    NavigationStack{
      VStack(spacing: 32){
        if let user = session.user {
          Spacer()
          Text("로그인 된 이메일: ")
          Text(user.email ?? "사용자 메일이 없습니다")
      
          Button(action: {
            // 로그아웃
            try? Auth.auth().signOut()
          }) {
            Text("로그아웃")
              .frame(maxWidth: .infinity)
              .padding()
              .background(.red)
              .foregroundColor(.white)
              .cornerRadius(8)
          }
          .padding(.horizontal)
          
          Spacer()
        }else{
          Text("로그인된 사용가 없습니다")
        }
        
      }
      .padding()
      .navigationTitle(Text("마이페이지"))
    }
  }
}

