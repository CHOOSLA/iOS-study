//
//  ContentView.swift
//  Clazzi
//
//  Created by choosla on 8/26/25.
//

import SwiftUI
import SwiftData

struct VoteView: View {
  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject private var session:  UserSession
  
  var vote: Vote
  
  @State private var selectedOption: Int = 0
  
  //  // 현재 유저가 이미 투표 했는지
  //  private var hasVoted: Bool {
  //    guard let userId = currentUserId else { return false }
  //
  //    //    return vote.options.contains(where: {$0.voters.contains(userId)})
  //    // 현재 두개의 contains가 있음
  //    // 첫 번째는 클로저를 받음
  //    // 두 번재는 매개변수를 받음 두개는 전혀 역할이 다름
  //    // •  ⁠contains { ... } (중괄호): 조건을 만족하는 요소가 있는지 확인합니다.
  //    // •  ⁠contains(...) (괄호): 특정 값과 동일한 요소가 있는지 확인합니다.
  //
  //    return vote.options.contains{ $0.voters.contains(userId) }
  //  }
  
  // 토스트 메시지
  @State private var toastMessage: String? = nil
  
  // 현재 유저가 이미 투표했는지 확인
  private var hasVoted: Bool {
    guard let user = session.user else { return false }
    return vote.options.contains(where: { $0.voters.contains(user.uid) })
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
          
          ForEach(vote.options.indices, id:\.self){ index in
            Button(action:{
              selectedOption = index
            }){
              HStack {
                Text(vote.options[index].name)
                Spacer()
                Text("\(vote.options[index].votes)")
                
                //이미 투표한 경우 표시
                if let user = session.user , vote.options[index].voters.first(where: {$0 == user.uid}){
                  Image(systemName:"checkmark.circle.fill")
                    .foregroundColor(.yellow)
                }
              }
            }.frame(maxWidth: 200)
              .padding()
              .background(index == selectedOption ? Color.green : Color.gray.opacity(0.5))
              .foregroundColor(.white)
              .clipShape(.capsule)
          }
          .disabled(hasVoted)
        }
        
        Spacer()
        
        // 투표하기
        Button(action:{
          guard let user = session.user, !hasVoted else {
            print("이미 투표했거나 유저 ID가 없습니다")
            
            // 토스트 노출
            toastMessage = "이미 투표했거나 유저 ID가 없습니다."
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
              withAnimation {
                toastMessage = nil
              }
            }
            return
          }
          
          // 투표 데이터 업데이트
          vote.options[selectedOption].voters.append(user.uid)
          
          // 모델 컨텍스트에 변경 사항 저장
          do{
            try modelContext.save()
            print("투표 저장 성공 : \(vote.options[selectedOption].name)")
          } catch {
            print("투표 저장 실패: \(error)")
          }
          
          print("투표 항목은 \(vote.options[selectedOption].name)입니다")
          
        }){
          Text("투표하기")
            .frame(maxWidth: .infinity)
            .padding()
            .background(hasVoted ? .gray : Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
          
          
        }
        .disabled(hasVoted)
        
        
      }
      
      if let toastMessage = toastMessage{
        ToastView(message: toastMessage)
      }
      
    }
    .navigationTitle(Text("투표 화면"))
    .padding()
    
    
  }
  
}


