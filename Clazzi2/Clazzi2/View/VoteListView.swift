//
//  VoteListView.swift
//  Clazzi2
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct VoteListView: View {
  @State private var isPresented: Bool = false
  @State private var votes: [String] = ["BMW vs 벤츠", "점메추 무엇??"]
  var body: some View {
    NavigationStack{
      ZStack {
        ScrollView {
          VStack(alignment : .leading, spacing: 16){
            ForEach(votes, id: \.self){ vote in
              VoteCard(title : vote)
            }
          }
        }
        
        VStack{
          Spacer()
          HStack {
            Spacer()
            Button(action: {
              isPresented = true
            }) {
              Image(systemName: "plus")
            }
            .padding(24)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .shadow(radius: 4)
          }
        }
      }
      .padding()
      .navigationTitle(Text("투표 목록 화면"))
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            isPresented = true
          }){
            Image(systemName: "plus")
          }
        }
      }
      .sheet(isPresented: $isPresented){
        Text("shhet")
      }
    }
  }
}

struct VoteCard: View {
  let title: String
  var body: some View{
    VStack(alignment: .leading){
      Text(title)
        .font(.headline)
        .foregroundColor(.white)
        .fontWeight(.bold)
      Text("투표 항목 보기")
        .foregroundColor(.white)
        .font(.subheadline)
    }.padding()
      .frame(maxWidth: .infinity, alignment: .leading)
    .background(.gray)
    .cornerRadius(16)
    .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    
  }
}

#Preview {
  VoteListView()
}
