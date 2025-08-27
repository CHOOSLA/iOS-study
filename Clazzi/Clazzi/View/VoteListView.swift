//
//  VoteListView.swift
//  Clazzi
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct VoteListView: View {
  //  let votes = ["첫 번째 투표","두 번째 투표", "세 번째 투표"]
  @State var votes = [
    Vote(title: "오늘 점심 메뉴 추천", options: ["돈까스","짜장"]),
    Vote(title: "오늘 저녁 메뉴 추천", options: ["야시장","편의점","굶기"]),
    Vote(title: "오늘 칼바람 추천", options: ["동진","박짜장","추이가"]),
  ]
  
  
  // 투표 생성관련
  @State private var isPresentingCreate = false
  
  // 투표 삭제 관련
  @State private var showDeleteAlert: Bool = false
  @State private var voteToDelete: Vote? = nil
  
  // 투표 수정 관련
  @State private var isPresentingEdit = false
  
  var body: some View {
    //    List{
    //      LazyVStack(spacing: 16){
    //        ForEach(votes.indices){ index in
    //          let vote = votes[index]
    //          NavigationLink(destination: VoteView(vote : vote)) {
    //            VoteCardView(vote: vote)
    //          }
    //        }
    //        .onDelete { indexSet in
    //          votes.remove(atOffsets: indexSet)
    //        }
    //      }
    //    }.listStyle(.grouped)
    
    NavigationStack {
      ZStack {
        ScrollView{
          LazyVStack(spacing: 16){
            ForEach(votes.indices, id: \.self){ index in
              let vote = votes[index]
              NavigationLink(destination: VoteView(vote : vote)) {
                VoteCardView(vote: vote){
                  voteToDelete = vote
                  showDeleteAlert = true
                  //                  votes.remove(at: index)
                } onEdit: {
                  isPresentingEdit = true
                }
              }
            }
            
          }.padding()
        }
        VStack{
          Spacer()
          HStack {
            Spacer()
            Button(action: {
              isPresentingCreate = true
            }){
              Image(systemName: "plus")
                .foregroundColor(.white)
                .padding(24)
                .background(.blue)
                .clipShape(Circle())
                .shadow(radius: 4)
            }
            .padding()
          }
        }
        
      }.navigationTitle(Text("투표 목록 화면"))
        .toolbar{
          ToolbarItem(placement: .navigationBarTrailing){
            // 화면 이동 방법1 : 툴바 네비게이션 링크
            //          NavigationLink(destination: CreateVoteView()) {
            //            Image(systemName: "plus")
            //              .foregroundColor(.blue)
            //          }
            
            // 화면 이동 방법2 : 상태를 이용한 이동 방법
            Button(action: {
              isPresentingCreate = true
            }) {
              Image(systemName: "plus")
            }
          }
        }
      // 화면 이동 방법 2: 상태를 이용한 이동 방법
        .navigationDestination(isPresented: $isPresentingCreate) {
          CreateVoteView(){ vote in
            votes.append(vote)
          }
        }
      
      // 수정화면
        .navigationDestination(isPresented: $isPresentingEdit) {
          CreateVoteView(){ vote in
            votes.append(vote)
          }
        }
      
      //        // 모달(바텀 시트)를 활용한 화면 화면 띄우는 방법(상태 이용)
      //        .sheet(isPresented: $isPresentingCreate) {
      //          CreateVoteView(){ vote in
      //            votes.append(vote)
      //          }
      //        }
      
      // 삭제 ㅏㄹ러트
        .alert("투표를 삭제하시겠습니까?",isPresented: $showDeleteAlert){
          Button("삭제", role : .destructive){
            if let target = voteToDelete, let index = votes.firstIndex(where: {$0.id == target.id}){
              votes.remove(at: index)
            }
          }
          Button("취소",role: .cancel){}
        } message: {
          if let target = voteToDelete{
            Text("'\(target.title)'가 삭제됩니다.")
          }
        }
      
      
      
    }
  }
}

struct VoteCardView: View {
  let vote: Vote
  let onDelete: () -> Void
  let onEdit: () -> Void
  var body: some View {
    HStack(alignment: .top) {
      VStack(alignment: .leading) {
        Text(vote.title)
          .font(.headline)
        Text("투표항목 보기")
          .font(.subheadline)
      }
      Spacer()
      Button(action: { onEdit() }) {
        Image(systemName: "pencil")
      }
      Button(action: { onDelete() }) {
        Image(systemName: "trash")
      }
    }
    .padding(16)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(.gray)
    .cornerRadius(12)
    .foregroundColor(.white)
    .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y:2)
  }
}

#Preview {
  VoteListView()
}
