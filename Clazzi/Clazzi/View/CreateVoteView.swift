//
//  CreateVoteView.swift
//  Clazzi
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct CreateVoteView: View {
  @Environment(\.dismiss) private var dismiss
  @State private var title: String = ""
  @State private var options: [String] = ["", ""]
  
  // 투표 목록 화면에서 전달해줄 콜백 메서드
  var onSave : (Vote) -> Void
  
  private var existingVote: Vote?

  init(vote: Vote? = nil, onSave: @escaping (Vote) -> Void){
    self.existingVote = vote
    _title = State(initialValue: vote?.title ?? "")
    _options = State(initialValue: vote?.options ?? [""])
    self.onSave = onSave
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
//        .navigationTitle(Text(existingVote == nil ? "투표 생성 화면" : "투표 수정 화면"))
        .navigationTitle(Text("투표 \(existingVote == nil ? "생성" : "수정") 화면"))
        
        // 생성하기 버튼
        Button(action: {
          let vote = Vote(title: title, options: options)
          onSave(vote)
          print("실행됨")
          dismiss()
        }) {
          Text(existingVote == nil ? "생성하기" : "수정하기")
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

#Preview {
  CreateVoteView(){ vote in }
}
