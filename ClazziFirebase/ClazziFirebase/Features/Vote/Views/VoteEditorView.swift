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
  
  
  // 토스트 메시지
  @State private var toastMessage: String? = nil
  
  init(vote: Vote? = nil, onSave: @escaping (Vote) -> Void){
    self.onSave = onSave
    self.title = vote?.title ?? ""
    self.options = vote?.options.map{$0.name} ?? ["",""]
    self.vote = vote
  }
  
  var body: some View {
    NavigationStack {
      ZStack{
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
              
              // 이미지 뷰
              Button(action: {}){
                Image(systemName: "photo.fill")
                  .resizable()
                  .scaledToFill()
                  .foregroundStyle(.gray)
              }
              .frame(width: 150, height: 150)
              .clipShape(Circle())
              .shadow(radius: 4)
              .frame(maxWidth: .infinity, alignment: .center)
              .padding(.bottom, 32)
              Text("투표 항목")
                .font(.headline)
              
              
              ForEach(options.indices, id: \.self) { index in
                HStack{
                  TextField("항목 \(index + 1)", text: $options[index])
                    .padding()
                    .background(
                      RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                    )
                  
                  Button(action : {
                    options.remove(at: index)
                  }){
                    Image(systemName: "xmark")
                  }
                  .foregroundColor(.gray)
                }
                .padding(.bottom,8)
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
            // 투포 제목검사
            // 타이틀 앞뒤 공백(개행무자 포함) 제거
            let title = title.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !title.isEmpty else {
              toastMessage = "제목을 제대로 입력해주세요."
              DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                withAnimation {
                  toastMessage = nil
                }
              }
              return
            }
            
            // 투표 항목 검사
            let options = options.map { option in
              option.trimmingCharacters(in: .whitespacesAndNewlines)
            }.filter {
              !$0.isEmpty
            }
            guard options.count >= 2 else {
              toastMessage = "투표 항목은 빈 칸을 제외한 두 개 이상이어야 합니다."
              DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                withAnimation {
                  toastMessage = nil
                }
              }
              return
            }
            
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
        
        if let toastMessage = toastMessage {
          ToastView(message: toastMessage, position: .middle)
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
