//
//  MyPageView.swift
//  Clazzi
//
//  Created by choosla on 8/28/25.
//

import SwiftUI

struct MyPageView: View {
  @Binding var currentUserId: UUID?
  
  var body: some View {
    NavigationStack{
      VStack{
        Text("로그인 된 이메일: ")
        Text("가짜 이메일")
        Button(action: {
//          isLoggedIn = false
//          UserDefaults.standard.set(false, forKey: "isLoggedIn")
          currentUserId = nil
          UserDefaults.standard.removeObject(forKey: "currentUserId")
        }) {
          Text("로그아웃")
            .frame(maxWidth: .infinity)
            .padding()
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
      }
      .padding()
      .navigationTitle(Text("마이페이지"))
    }
  }
}

//struct MyPageView_Previews: PreviewProvider {
//  struct Wrapper: View {
//    @State var isLoggedIn: Bool = false
//    var body: some View {
//      MyPageView(isLoggedIn: $isLoggedIn)
//    }
//  }
//  static var previews: some View {
//    Wrapper()
//  }
//}

#Preview {
//  @Previewable @State var isLoggedIn: Bool = false
  @Previewable @State var currentUserId: UUID? = UUID(uuidString: "이건 가짜 계정")
  MyPageView(currentUserId: $currentUserId)
}
