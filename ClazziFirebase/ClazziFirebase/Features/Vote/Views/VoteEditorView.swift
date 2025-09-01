//
//  CreateVoteView.swift
//  Clazzi
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct VoteEditorView: View {
  @Environment(\.dismiss) private var dismiss
  @State private var title: String
  @State private var options: [String]
  
  @EnvironmentObject private var session: UserSession
  
  // 투표 목록 화면에서 전달해줄 콜백 메서드
  var onSave : (Vote) -> Void

  
  private var vote: Vote? = nil

  init(vote: Vote? = nil, onSave: @escaping (Vote) -> Void){
    self.onSave = onSave
    self.title = vote?.title ?? ""
    self.options = vote?.options.map{$0.name} ?? ["",""]
    self.vote = vote
  }
  
  var body: some View {
    NavigationStack {
      VStack {
        ScrollView {
          VStack(alignment: .leading) {
            TextField("투표 제목", text: $title)
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 8)
                  .stroke(Color.gray, lineWidth: 1)
              )
              .padding(.bottom, 32)
            Text("투표 항목")
              .font(.headline)
            
            
            ForEach(options.indices, id: \.self) { index in
              TextField("항목 \(index + 1)", text: $options[index])
                .padding()
                .background(
                  RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
                )
            }
            
            
            Button("항목 추가") {
              options.append("")
            }
            .buttonStyle(.bordered)
            .frame(maxWidth: .infinity, alignment: .trailing)
            Spacer()
            
          }
        }
        .navigationTitle(Text("투표 \(vote == nil ? "생성" : "수정") 화면"))
        
        // 생성하기 버튼
        Button(action: {
//          let newOptions = options.map{
//            VoteOption(name: $0)
//          }
//          let vote = Vote(title: title, options: newOptions)
//          onSave(vote)
          if var vote = vote{
            // 기존 객체를 직접 수정
            vote.title = title
            
            // 기존 옵션 삭제 후 새로 생성
            vote.options = options.map { VoteOption(name: $0) }
            onSave(vote)
          }else{
            // 새 객체 생성
            let newVote = Vote(title: title,createdBy: session.user?.uid ?? "", options: options.map{ VoteOption(name: $0)})
            onSave(newVote)
          }
          
          print("실행됨")
          dismiss()
        }) {
          Text(vote == nil ? "생성하기" : "수정하기")
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
      }
      .padding()
    }
  }
}

//#Preview("투표 생성") {
//  VoteEditorView() { _ in }
//}
//
//#Preview("투표 수정"){
//  // 샘플 투표 생성
//  let sampleVote = Vote(title: "샘플 투표", options: [
//    VoteOption(name: "옵션 1"),
//    VoteOption(name: "옵션 2")
//  ])
//  
//  // 뷰에 샘플로 전달
//  VoteEditorView(vote: sampleVote) { vote in
//    print("변경된 투표: \(vote)")
//  }
//}
//
////#Preview {
////  VoteEditorView(){ vote in }
////}
