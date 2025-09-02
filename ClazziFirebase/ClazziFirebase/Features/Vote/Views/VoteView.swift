//
//  ContentView.swift
//  Clazzi
//
//  Created by choosla on 8/26/25.
//

import SwiftUI
import SwiftData

struct VoteView: View {
  // @EnvironmentObject : 전역으로 관리하는 커스텀 객체
  @EnvironmentObject private var session: UserSession
  // 뒤로 가기
  // @Environment : 시스템에서 제공하는 값
  @Environment(\.dismiss) private var dismiss
  
  @State private var selectedOption: Int = 0
  
  @State var vote: Vote
  
  // 현재 유저가 이미 투표했는지 확인
  private var hasVoted: Bool {
    guard let user = session.user else { return false }
    
    //  // 현재 유저가 이미 투표 했는지
    //  private var hasVoted: Bool {
    //    guard let userId = currentUserId else { return false }
    //
    //    //    return vote.options.contains(where: {$0.voters.contains(userId)})
    //    // 현재 두개의 contains가 있음
    //    // 첫 번째는 클로저를 받음
    //    // 두 번재는 매개변수를 받음 두개는 전혀 역할이 다름
    //    // •  ⁠contains { ... } (중괄호): 조건을 만족하는 요소가 있는지 확인합니다.
    //    // •  ⁠contains(…) (괄호): 특정 값과 동일한 요소가 있는지 확인합니다.
    //
    //    return vote.options.contains{ $0.voters.contains(userId) }
    //  }

    
    return vote.options.contains { $0.voters.contains(user.uid) }
  }
  
  // 토스트 메세지
  @State private var toastMessage: String? = nil
  
  var onVote: (Vote) -> Void
  
  private var votedIndex: Int? {
    guard hasVoted, let user = session.user else { return nil }
    return vote.options.firstIndex { $0.voters.contains(user.uid) }
  }

  
  var body: some View {
    NavigationStack {
      ZStack {
        VStack {
          Spacer()
          
          Text(vote.title)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.bottom)
          
          // 이미지뷰
          if let imageURL = vote.imageURL, let url = URL(string: imageURL) {
            AsyncImage(url: url){ image in
              image.resizable().scaledToFill()
            } placeholder: {
              ProgressView()
            }
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .shadow(radius: 4)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom, 32)
          }
          
          ForEach(vote.options.indices, id: \.self) { index in
            Button(action: {
               
                selectedOption = index
              
              
            }) {
              HStack {
                Text(vote.options[index].name)
                
                Spacer()
                
                // 이미 투표한 경우 표시
                if let user = session.user,
                   vote.options[index].voters.contains(user.uid){
                  Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.white)
                }
                
                Text("\(vote.options[index].voters.count)")
              }
              .padding(.horizontal)
              .frame(maxWidth: 200)
              .padding()
              // 해당 인덱스가 내가 투표한 것이라면?
              .background((!hasVoted)  ? (index == selectedOption) ? Color.green : Color.gray.opacity(0.5)
                          : (votedIndex ?? -1) == index ? Color.green : Color.gray.opacity(0.5))
              .foregroundColor(.white)
              .clipShape(Capsule())
            }.disabled(hasVoted)
          }
          
          Spacer()
          
          // 투표하기
          Button(action: {
            guard let user = session.user, !hasVoted else {
              // 토스트 노출
              toastMessage = "이미 투표했거나 유저 ID가 없습니다."
              DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                  toastMessage = nil
                }
              }
              
              return
            }
            
            // 투표 데이터 업데이트
            vote.options[selectedOption].voters.append(user.uid)
            onVote(vote)
          }) {
            Text("투표하기")
              .frame(maxWidth: .infinity)
              .padding()
              .background(hasVoted ? .gray : Color.blue)
              .foregroundColor(.white)
              .clipShape(RoundedRectangle(cornerRadius: 8))
          }
          .disabled(hasVoted)
          
        }
        
        if let toastMessage = toastMessage {
          ToastView(message: toastMessage)
        }
      }
      .padding()
      .navigationTitle(Text("투표 화면"))
    }
  }
}

