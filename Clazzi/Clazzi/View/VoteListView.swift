//
//  VoteListView.swift
//  Clazzi
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct VoteListView: View {
  let votes = ["첫 번째 투표","두 번째 투표", "세 번째 투표"]
  
  @State private var isPresentingCreate = false
  var body: some View {
    NavigationStack {
      ZStack {
        ScrollView{
          LazyVStack(spacing: 16){
            ForEach(votes, id: \.self){ vote in
              VoteCardView(vote: vote)
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
      //      // 화면 이동 방법 2: 상태를 이용한 이동 방법
      //      .navigationDestination(isPresented: $isPresentingCreate) {
      //        CreateVoteView()
      //      }
      
        .sheet(isPresented: $isPresentingCreate) {
          CreateVoteView()
        }
      
    }
  }
}

struct VoteCardView: View {
  let vote: String
  var body: some View {
    VStack(alignment: .leading) {
      Text(vote)
        .font(.headline)
      Text("투표항목 보기")
        .font(.subheadline)
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
