//
//  ContentView.swift
//  MVVMStudy
//
//  Created by choosla on 8/29/25.
//

import SwiftUI

struct VoteListView: View {
  @StateObject private var viewModel = VoteListViewModel()
  @State private var showingEditor = false
  var body: some View {
    NavigationStack{
      List{
        ForEach(viewModel.getVotes()){ vote in
          Text(vote.title)
        }
      }
      .navigationTitle("투표 목록")
      .toolbar{
        ToolbarItem(){
          Button(action : {
            showingEditor = true
//            viewModel.addVote(Vote(id: UUID(), title: "새로운 투표", options: ["항목1"]))
          }){
            Image(systemName: "plus")
          }
        }
      }
      .sheet(isPresented: $showingEditor) {
        Text("Test")
      }
    }
  }
}

#Preview {
  VoteListView()
}
