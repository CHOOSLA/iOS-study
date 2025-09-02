
import Foundation
import FirebaseAuth


class UserSession: ObservableObject {
  @Published var user: User?
  
  private var handle: AuthStateDidChangeListenerHandle?
  
  init() {
    // Auth.auth().currentUser: 현재 로그인된 사용자 가져오기
    self.user = Auth.auth().currentUser
    // addStateDidChangeListener : 사용자 인증 상태 감지
    handle = Auth.auth().addStateDidChangeListener { _, user in
      self.user = user
    }
  }
}
