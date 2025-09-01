//
//  ContentView.swift
//  Clazzi
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct VoteView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var modelContext
  
  //  let options = ["김치찌개", "돈까스"]
  @State private var selectedOption: Int = 0
  @Bindable var vote: Vote
  @Binding var currentUserId: UUID?
  
  // 현재 유저가 이미 투표 했는지
  private var hasVoted: Bool {
    vote.options.contains(where: {$0.voters.contains(currentUserId ?? UUID())})
  }
  
  private var votedIndex: Int? {
    guard let uid = currentUserId else { return nil }               // 유저 ID가 없으면 미투표로 간주한다
    return vote.options.firstIndex { $0.voters.contains(uid) }       // voters 배열에 uid가 포함되어 있으면 해당 인덱스를 반환한다
  }

  
  var body: some View {
    NavigationStack {
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
              if vote.options[index].voters.first(where: {$0 == currentUserId}) != nil{
                Image(systemName:"checkmark.circle.fill")
                  .foregroundColor(.yellow)
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
          guard let currentUserId = currentUserId, !hasVoted else {
            print("이미 투표했거나 유저 ID가 없습니다")
            return
          }
          
          // 투표 데이터 업데이트
          vote.options[selectedOption].voters.append(currentUserId)
          
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
      .navigationTitle(Text("투표 화면"))
      .padding()
      .onAppear {
        // 화면 진입 시, 이미 투표한 유저라면 선택 상태를 실제 투표 인덱스로 동기화한다
        if let idx = votedIndex {
          selectedOption = idx
        }
      }
      .onChange(of: currentUserId) { _ in
        // 유저가 바뀌면 선택 상태를 다시 동기화한다
        if let idx = votedIndex {
          selectedOption = idx
        } else {
          selectedOption = 0
        }
      }
    }
  }
}

#Preview {
  @Previewable @State var currentUserId: UUID? = UUID(uuidString: "이건 가짜 계정")
  VoteView(vote: Vote(title: "오늘 점심 메뉴 추천", options: [
    VoteOption(name: "옵션1"),
    VoteOption(name: "옵션1")
  ]), currentUserId: $currentUserId)
}
