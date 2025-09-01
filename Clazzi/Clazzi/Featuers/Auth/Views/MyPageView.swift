//
//  MyPageView.swift
//  Clazzi
//
//  Created by choosla on 8/28/25.
//

import SwiftUI
import SwiftData

struct MyPageView: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var users: [User]
  @Binding var currentUserId: UUID?
  
  var body: some View {
    NavigationStack{
      VStack(spacing: 32){
        if let user = users.first(where: { $0.id == currentUserId }) {
          Spacer()
          Text("로그인 된 이메일: ")
          Text(user.email)
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

//#Preview {
////  @Previewable @State var isLoggedIn: Bool = false
//  @Previewable @State var currentUserId: UUID? = UUID(uuidString: "이건 가짜 계정")
//  MyPageView(currentUserId: $currentUserId)
//}

#Preview {
  @Previewable @State var currentUserId: UUID? = nil
  
  // 1. 컨테이너 만들기
  let container = try! ModelContainer(
    for: User.self,
    configurations: ModelConfiguration(isStoredInMemoryOnly: true)
  )
  
  // 2. 가짜 사용자 추가
  let context = container.mainContext
  let fakeUser = User(email: "text@exmaple.com" , password: "1234")
  context.insert(fakeUser)
  
  // 3. 뷰에 연결
  return MyPageView(currentUserId: $currentUserId)
    .modelContainer(container)
    .onAppear {
      // 4. MyPageView가 렌더링 된 후 ID를 프리뷰 상태에 세팅
      currentUserId = fakeUser.id
    }
}
